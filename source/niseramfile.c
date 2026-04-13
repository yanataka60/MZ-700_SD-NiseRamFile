//  MZ-1500 Multi-function RAMFILE card 'Niseramfile'
//
//  MZ-1R12: RAM Memory (NO Battery backup)
//  MZ-1R18: RAMFILE
//  MZ-1R23: Kanji ROM
//  MZ-1R24: Jisho ROM
//  PIO-3034: EMM

//  MZ-1500 extention slot
//  GP0-7:  D0-7
//  GP8-23: A0-15
//  GP24: EXINT
//  GP25: RESET -> Interrupt
//  GP26: M1
//  GP28: MERQ
//  GP29: IORQ
//  GP30: WR
//  GP31: RD
//  GP32: EXWAIT

#define FLASH_INTERVAL 300      // 5sec

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/sync.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "hardware/timer.h"
#include "hardware/uart.h"
#include "hardware/flash.h"
#include "hardware/sync.h"
#include "hardware/vreg.h"

#include "vga16_graphics.h"

#include "misc.h"

// ======================================================
// SN76489 Emulator
// ======================================================

#define SOUND_PIN 47
#define CLOCK_SN 3546895u
#define SAMPLE_RATE 44100

uint32_t pwm_slice_num;

typedef struct {
    uint16_t tone[3];
    uint8_t volume[4];
    uint8_t latched;

    uint32_t phase[4];
    uint32_t step[4];
    uint8_t output[4];

    uint16_t lfsr;
    uint8_t noise_mode;
    uint8_t noise_freq;

    int32_t dc;
    int32_t lp1;
    int32_t lp2;
} SN76489;

SN76489 sn_l, sn_r;

static const uint16_t vol_table[16] = {
    32767,26028,20675,16422,
    13045,10362,8231,6538,
    5197,4125,3277,2603,
    2067,1642,1304,0
};

// ======================================================
// i8253 PIT Emulator
// ======================================================

#define I8253CLOCK 894000 // NTSC

volatile uint8_t i8253[3];
volatile uint8_t i8253_access[3];
volatile uint16_t i8253_preload[3];
volatile uint16_t i8253_counter[3];
volatile uint8_t i8253_pending[3];
volatile uint16_t i8253_latch[3];
volatile uint32_t i8253_latch_flag=0;
volatile uint32_t i8253_enable_irq=0;

volatile uint32_t beep_flag=0;
volatile uint32_t beep_mute=0;

volatile uint8_t memioport[16];
volatile uint8_t pioa[4];
volatile uint8_t pioa_data;
volatile uint32_t pioa_enable_irq;
static repeating_timer_t sound_timer;

// PIO 状態保持（モード3用）
static uint8_t pioa_next_mask = 0;
static uint8_t pioa_next_iocontrol = 0;

static inline int32_t i8253_tick(void)
{
    uint16_t timer_diffs;
    uint32_t beep_on=0;
    uint32_t beep_volume=0;

    if(memioport[8]&1) {
        timer_diffs = I8253CLOCK / SAMPLE_RATE;

        if(timer_diffs < i8253_counter[0]) {
            i8253_counter[0] -= timer_diffs;
            if(memioport[2]&1) {
                beep_on = 1;
                switch(i8253[0] & 0x0E) {
                    case 0x06: // mode 3
                        beep_volume = (i8253_counter[0] > (i8253_preload[0]/2)) ? 255 : 0;
                        break;
                    case 0x00: // mode 0
                        beep_volume = 0;
                        break;
                    case 0x0A: // mode 5
                        beep_volume = 255;
                        break;
                }
            }
        } else {
            i8253_counter[0] = i8253_counter[0] + (i8253_preload[0] - timer_diffs);
            // タイマ割り込み (チャンネル0 → PIO ビット4)
            if((pioa[2] & 0x80) && ((pioa[3] & 0x10) == 0)) {
                pioa_enable_irq = 1;
                pioa_data |= 0x10;
            }
        }
    } else {
        if(memioport[2]&1) {
            beep_on = 1;
            beep_volume = 255;
        }
    }

    if(beep_mute) return 0;
    return beep_on ? (int32_t)beep_volume : 0;
}

static inline void sn_reset(SN76489 *sn)
{
    memset(sn, 0, sizeof(SN76489));
    for(int i=0;i<4;i++) sn->volume[i] = 15;
    for(int i=0;i<4;i++) sn->phase[i] = 0;
    sn->lfsr = 0x4000;
	sn->output[3] = 0;
	sn->dc = 0;
    sn->lp1 = 0;
    sn->lp2 = 0;
}

static inline void sn_write(SN76489 *sn, uint8_t data)
{
    if(data & 0x80) {
        sn->latched = (data >> 4) & 7;
        int ch = (sn->latched >> 1) & 3;
        if((sn->latched & 1)==0) {
            if(ch < 3) sn->tone[ch] = (sn->tone[ch] & 0x3F0) | (data & 0x0F);
            else {
                sn->noise_mode = (data >> 2) & 1;
                sn->noise_freq = data & 3;
			    sn->lfsr = 0x4000;
			    sn->output[3] = 0;
            }
        } else {
            sn->volume[ch] = data & 0x0F;
        }
    } else {
        int ch = (sn->latched >> 1) & 3;
        if((sn->latched & 1)==0 && ch < 3)
            sn->tone[ch] = (sn->tone[ch] & 0x00F) | ((data & 0x3F) << 4);
    }

    uint64_t base = ((uint64_t)CLOCK_SN << 32) / (32 * SAMPLE_RATE);
    for(int i=0;i<3;i++) {
        uint16_t N = sn->tone[i];
        if(N == 0) { sn->step[i] = 0; continue; }
        if(N < 2) N = 2;
        sn->step[i] = (uint32_t)(base / N);
    }

    switch(sn->noise_freq) {
        case 0: sn->step[3] = (uint32_t)(base / 16); break;
        case 1: sn->step[3] = (uint32_t)(base / 32); break;
        case 2: sn->step[3] = (uint32_t)(base / 64); break;
        case 3: sn->step[3] = sn->step[2]; break;
    }
}

static inline int16_t sn_generate(SN76489 *sn)
{
    int32_t mix = 0;
    for(int i=0;i<3;i++) {
        sn->phase[i] += sn->step[i];
        int32_t s = (sn->phase[i] & 0x80000000) ? 32767 : -32767;
        mix += (s * vol_table[sn->volume[i]]) >> 15;
    }

	// ノイズ生成（完全版）
	uint32_t old = sn->phase[3];
	sn->phase[3] += sn->step[3];

	if((old ^ sn->phase[3]) & 0x80000000) {

	    if(sn->noise_mode == 0) {
	        // ===== 周期ノイズ（ここが重要）=====
	        sn->output[3] ^= 1;   // トグルのみ（LFSR使わない）
	    } else {
	        // ===== ホワイトノイズ =====
	        uint16_t fb = ((sn->lfsr >> 14) ^ (sn->lfsr >> 13)) & 1;
	        sn->lfsr = ((sn->lfsr << 1) | fb) & 0x7FFF;
	        sn->output[3] = sn->lfsr & 1;
	    }
	}
	
	int32_t n = sn->output[3] ? 32767 : -32767;
	int32_t noise = (n * vol_table[sn->volume[3]]) >> 15;
	noise = noise >> 2;   // 強度調整
	mix += noise;
	
    if(mix > 30000) mix = 30000;
    if(mix < -30000) mix = -30000;
    return mix >> 5;
}

#include "hardware/pwm.h"

void sound_task()
{

    static uint32_t last = 0;

    static int32_t dc = 0;
    static int32_t lp1 = 0;
    static int32_t lp2 = 0;

    static int32_t delay = 0;

    uint32_t now = time_us_32();

    while(now - last >= (1000000 / SAMPLE_RATE)) {
        last += (1000000 / SAMPLE_RATE);

        int32_t l = sn_generate(&sn_l);
        int32_t r = sn_generate(&sn_r);

        // ★ 疑似ステレオ
		int32_t pit = i8253_tick();

// SN + PIT ミックス
		int32_t mix = ((l + r) >> 1) + (pit * 3);
        delay = r;

        // DCカット
        dc += (mix - dc) >> 10;
        mix -= dc;

        // 2段ローパス（実機っぽい丸さ）
        lp1 += (mix - lp1) >> 3;
        lp2 += (lp1 - lp2) >> 4;

        int32_t out = lp2;

        if(out < -2048) out = -2048;
        if(out >  2047) out =  2047;

        pwm_set_gpio_level(SOUND_PIN, out + 2048);
    }
}


void sound_init()
{
    gpio_set_function(SOUND_PIN, GPIO_FUNC_PWM);
    pwm_slice_num = pwm_gpio_to_slice_num(SOUND_PIN);
    pwm_config cfg = pwm_get_default_config();
    pwm_config_set_clkdiv(&cfg, 1.0f);
    pwm_config_set_wrap(&cfg, 4095);
    pwm_init(pwm_slice_num, &cfg, true);
}

#define RESET_PIN 25

// RAM configuration
uint8_t __attribute__ ((aligned(4096))) mz1r12[0x8000];
uint8_t __attribute__ ((aligned(4096))) mz1r18[0x10000];
uint8_t __attribute__ ((aligned(4096))) emm[0x50000];

// PCG emulation
uint8_t vram[0x1000];
uint8_t cgram[0x1000];
uint8_t pcg[0x2000 * 3];
uint8_t pcg700[0x800];

volatile uint8_t vram_enabled;
volatile uint8_t pcg_enabled;

#define MAXROMPAGE 64
#define MAXEMMPAGE 32

volatile uint8_t rompage=0;
volatile uint8_t emmpage=0;

volatile uint32_t kanjiptr=0;
volatile uint32_t dictptr=0;
volatile uint32_t kanjictl=0;
volatile uint32_t mz1r18ptr=0;
volatile uint32_t mz1r12ptr=0;
volatile uint32_t emmptr=0;
volatile uint32_t flash_command=0;
volatile uint32_t pcg700_ptr=0;

// ROM configuration
#define ROMBASE 0x10080000u

uint8_t *fontrom=(uint8_t *)(ROMBASE-0x61000);
uint8_t *kanjirom=(uint8_t *)(ROMBASE-0x60000);
uint8_t *jishorom=(uint8_t *)(ROMBASE-0x40000);
uint8_t *romslots=(uint8_t *)(ROMBASE);
uint8_t *emmslots=(uint8_t *)(ROMBASE+(0x8000*MAXROMPAGE));

// ======================================================
// サウンドハンドラ (HSYNC 割り込み内で呼び出し)
// ======================================================
volatile uint32_t sound_tick = 0;
uint16_t psg_master_volume = 0;

// VGA Output
uint8_t scandata[320];
extern unsigned char vga_data_array[];
volatile uint32_t video_hsync,video_vsync,scanline,vsync_scanline;
volatile uint8_t pcg_control;
volatile uint8_t pcg700_control,pcg700_data;
uint8_t pallet[8];

void __not_in_flash_func(mzscan)(uint8_t scan);

// ========== 修正: hsync_handler 内のタイマ割り込み処理 ==========
void __not_in_flash_func(hsync_handler)(void)
{

	pio_interrupt_clear(pio0, 0);

    if((scanline!=0) && (gpio_get(VSYNC)==0)) {
        scanline=0;
        video_vsync=1;
    } else {
        scanline++;
    }

    if((scanline%2)==0) {
        video_hsync=1;
        if((scanline>=73) && (scanline<=472)) {
            uint32_t tmsscan = (scanline-73)/2;
            uint32_t vramindex = (tmsscan%4)*320;
            mzscan(tmsscan);
            for(int j=0;j<320;j++) vga_data_array[vramindex+j] = scandata[j];
        }
    }

    // i8253 チャンネル1 (15.75kHz クロック)
    if((i8253_access[1]<2) && (i8253_preload[1]!=0)) {
        if(i8253_counter[1] > 1) {
            i8253_counter[1]--;
            if(i8253_counter[1] == 1) {
                // チャンネル2 をデクリメント
                if((i8253_access[2]<2) && (i8253_preload[2]!=0)) {
                    if(i8253_pending[2]) {
                        i8253_pending[2] = 0;
                    } else {
                        if(i8253_counter[2] > 1) {
                            i8253_counter[2]--;
                        } else {
                            // カウンタが0になったら割り込み発生 (ワンショット)
                            if(memioport[2] & 0x04) {
                                i8253_enable_irq = 2;
                            }
                            // PIO 割り込み条件をチェック (ビット5 = タイマ割り込み)
                            if((pioa[2] & 0x80) && ((pioa[3] & 0x20) == 0)) {
                                pioa_enable_irq = 1;
                                pioa_data |= 0x20;
                            }
                            // モード0: カウンタを停止 (リロードしない)
                        }
                    }
                }
            }
        } else {
            i8253_counter[1] = i8253_preload[1];
        }
    }
}

// ========== PIOA データ読み出し (割り込みフラグクリア) ==========
static inline uint8_t pioa_read(void)
{
    uint8_t ret = pioa_data;
    pioa_data &= ~0x30;   // ビット4,5 クリア
    return ret;
}

// ========== I/O 書き込み (PIO 完全実装) ==========
static inline void io_write(uint16_t address, uint8_t data)
{
    uint8_t b;

    switch(address & 0xFF) {
        case 0xb8: kanjictl = data; return;
        case 0xb9: dictptr = data + (address & 0xFF00); kanjiptr = dictptr << 5; return;
        case 0xea: mz1r18[mz1r18ptr & 0xFFFF] = data; mz1r18ptr++; return;
        case 0xeb: mz1r18ptr = data + (address & 0xFF00); return;
        case 0xf8: mz1r12ptr = (data << 8) + (mz1r12ptr & 0xFF); mz1r12ptr &= 0x7FFF; return;
        case 0xf9: mz1r12ptr = data + (mz1r12ptr & 0xFF00); return;
        case 0xfa: mz1r12[mz1r12ptr & 0x7FFF] = data; mz1r12ptr++; if(mz1r12ptr > 0x7FFF) mz1r12ptr = 0; return;
        case 0xba: rompage = data & 0x3F; flash_command = 0x10000000 + (data & 0x3F); return;
        case 0xbb: rompage = data & 0x3F; flash_command = 0x20000000 + (data & 0x3F); return;
        case 0xbc: emmpage = data & 0x1F; flash_command = 0x30000000 + (data & 0x1F); return;
        case 0xbd: emmpage = data & 0x1F; flash_command = 0x40000000 + (data & 0x1F); return;
        case 0x00: emmptr = (emmptr & 0x7FF00) + data; return;
        case 0x01: emmptr = (emmptr & 0x700FF) + (data << 8); return;
        case 0x02: emmptr = (emmptr & 0xFFFF) + ((data & 7) << 16); return;
        case 0x03: if(emmptr > 0x4FFFF) emmptr -= 0x50000; emm[emmptr++] = data; return;
        case 0xe1: vram_enabled = 0; return;
        case 0xe3: vram_enabled = 1; return;
        case 0xe4: vram_enabled = 1; pcg_enabled = 0xFF; return;
        case 0xe5: pcg_enabled = data & 3; return;
        case 0xe6: pcg_enabled = 0xFF; return;
        case 0xf0: pcg_control = data; return;
        case 0xf1: pallet[(data & 0x70) >> 4] = data & 7; return;
        case 0xf2: sn_write(&sn_l, data); return;
        case 0xf3: sn_write(&sn_r, data); return;
        case 0xe9: sn_write(&sn_l, data); sn_write(&sn_r, data); return;

        // ===== PIOA (アドレス 0xFC) =====
        case 0xfc:
            if(pioa_next_mask) {
                pioa[3] = data;          // マスクレジスタ
                pioa_next_mask = 0;
                return;
            }
            if(pioa_next_iocontrol) {
                pioa_next_iocontrol = 0;
                return;
            }
            switch(data & 0x0F) {
                case 0x00: case 0x02: case 0x04: case 0x08:
                case 0x0A: case 0x0C: case 0x0E:
                    pioa[0] = data;       // コントロールワード
                    return;
                case 0x03: // 割り込み許可/禁止
                    if(data & 0x80) pioa[2] |= 0x80;
                    else pioa[2] &= 0x7F;
                    return;
                case 0x07: // 割り込み制御
                    pioa[2] = data;
                    if(data & 0x10) pioa_next_mask = 1;
                    return;
                case 0x0F: // モード制御
                    if((data & 0xC0) == 0xC0) pioa_next_iocontrol = 1;
                    return;
                default: return;
            }
            break;

        // ===== PIOB (アドレス 0xFD) は未使用なので簡易実装 =====
        case 0xfd:
            // 必要に応じて実装 (今回はダミー)
            return;

        // ===== PIOA データ書き込み (アドレス 0xFE) =====
        case 0xfe:
            pioa_data = data;
            pioa_data &= 0xCF;   // ビット4,5 は読み出し専用
            return;
    }
}

// ========== メモリ書き込み (元のまま) ==========
static inline void memory_write(uint16_t address, uint8_t data)
{
    if(address < 0xD000) return; // Main RAM は無視

    if((pcg_enabled != 0xFF) && (address < 0xF000)) {
        if((pcg_enabled & 3) != 0) {
            pcg[(address - 0xD000) + ((pcg_enabled & 3) - 1) * 0x2000] = data;
        }
    } else if(vram_enabled && (address < 0xE000)) {
        vram[address & 0xFFF] = data;
    } else if(vram_enabled && (address >= 0xE800)) {
        mz1r12[address - 0xE800] = data;
    } else if(vram_enabled) {
        switch(address) {
            case 0xE002: // i8255 ポートC
                if(data & 1) beep_mute = 0; else beep_mute = 1;
                if(data & 4) i8253_enable_irq = 1; else i8253_enable_irq = 0;
                memioport[2] = data;
                return;
            case 0xE003: // i8255 ポートC ビット操作
                if((data & 0x80) == 0) {
                    uint8_t b = (data & 0x0E) >> 1;
                    if(data & 1) memioport[2] |= (1 << b);
                    else memioport[2] &= ~(1 << b);
                }
                return;
            case 0xE004: case 0xE005: case 0xE006: { // i8253 チャンネル0-2
                int ch = address - 0xE004;
                if((i8253[ch] & 0x30) == 0x30) {
                    if(i8253_access[ch]) {
                        i8253_preload[ch] = (i8253_preload[ch] & 0xFF) | (data << 8);
                        i8253_access[ch] = 0;
                        i8253_counter[ch] = i8253_preload[ch];
                    } else {
                        i8253_preload[ch] = (i8253_preload[ch] & 0xFF00) | data;
                        i8253_access[ch] = 2;
                    }
                }
                if((i8253[ch] & 0x30) == 0x20) {
                    i8253_preload[ch] = (data << 8);
                    i8253_counter[ch] = i8253_preload[ch];
                }
                if((i8253[ch] & 0x30) == 0x10) {
                    i8253_preload[ch] = data;
                    i8253_counter[ch] = i8253_preload[ch];
                }
                i8253_pending[ch] = 1;
                return;
            }
            case 0xE007: { // i8253 コントロール
                uint8_t b = (data & 0xC0) >> 6;
                if(b != 3) {
                    if((data & 0x30) == 0) {
                        i8253_latch[b] = i8253_counter[b];
                        i8253_latch_flag = 1;
                    }
                    i8253[b] = data;
                }
                return;
            }
            case 0xE008: // Beep 制御
                if(data & 1) beep_flag = 1; else beep_flag = 0;
                memioport[8] = data;
                return;
            case 0xE010: pcg700_data = data; return;
            case 0xE011: pcg700_ptr &= 0x700; pcg700_ptr |= data; return;
            case 0xE012:
                if(pcg700_control & 0x10) {
                    if((data & 0x10) == 0) {
                        if(pcg700_control & 0x20) {
                            if(pcg700_ptr < 0x400) pcg700[pcg700_ptr] = cgram[pcg700_ptr + 0x400];
                            else pcg700[pcg700_ptr] = cgram[pcg700_ptr + 0x800];
                        } else {
                            pcg700[pcg700_ptr] = pcg700_data;
                        }
                    }
                } else {
                    if(data & 0x10) {
                        pcg700_ptr &= 0xFF;
                        pcg700_ptr |= (data & 7) << 8;
                    }
                }
                pcg700_control = data;
                return;
        }
    }
}

// ========== リセット処理 ==========
void __not_in_flash_func(z80reset)(uint gpio, uint32_t event)
{
    gpio_acknowledge_irq(RESET_PIN, GPIO_IRQ_EDGE_RISE);
    if(gpio_get(RESET_PIN) == 0) return;

    kanjiptr = 0;
    dictptr = 0;
    kanjictl = 0;
    mz1r18ptr = 0;
    mz1r12ptr = 0;
    emmptr = 0;
    pcg_control = 0;
    pcg700_ptr = 0;
    pcg700_control = 0xFF;
    vram_enabled = 1;
    pcg_enabled = 0xFF;

    memset((void*)i8253, 0, sizeof(i8253));
    memset((void*)i8253_counter, 0, sizeof(i8253_counter));
    memset((void*)i8253_preload, 0, sizeof(i8253_preload));
    memset((void*)i8253_access, 0, sizeof(i8253_access));

    sound_init();
    sn_reset(&sn_l);
    sn_reset(&sn_r);
}

// ========== VGA スキャン ==========
void __not_in_flash_func(mzscan)(uint8_t scan)
{
    // 元のコードと同じ (変更なし)
    uint8_t scanx, scany, scanyy;
    uint8_t ch, color, font, pcgfontb, pcgfontr, pcgfontg, fgcolor, bgcolor;
    uint16_t pcgch;
    uint32_t offset;
    uint8_t scan_buffer[8];
    union bytemember { uint32_t w; uint8_t b[4]; };
    union bytemember bitf1, bitf2, bitb1, bitb2, bitp1, bitp2;

    scany = scan / 8;
    scanyy = scan % 8;
    offset = scany * 40;

    for(scanx = 0; scanx < 40; scanx++) {
        ch = vram[offset];
        color = vram[offset + 0x800];

        if(((pcg700_control & 8) == 0) && (ch > 0x7F)) {
            if(color & 0x80) font = pcg700[(ch & 0x7F) * 8 + scanyy + 0x400];
            else font = pcg700[(ch & 0x7F) * 8 + scanyy];
        } else {
            if(color & 0x80) font = cgram[ch * 8 + scanyy + 0x800];
            else font = cgram[ch * 8 + scanyy];
        }

        fgcolor = (color & 0x70) >> 4;
        bgcolor = color & 7;

        bitf1.w = bitexpand[font * 4] * fgcolor;
        bitf2.w = bitexpand[font * 4 + 1] * fgcolor;
        bitb1.w = bitexpand[font * 4 + 2] * bgcolor;
        bitb2.w = bitexpand[font * 4 + 3] * bgcolor;

        if((pcg_control & 1) && (vram[offset + 0xC00] & 8)) {
            pcgch = vram[offset + 0x400] + ((uint16_t)vram[offset + 0xC00] & 0xC0) * 4;
            pcgfontb = pcg[pcgch * 8 + scanyy];
            pcgfontr = pcg[pcgch * 8 + scanyy + 0x2000];
            pcgfontg = pcg[pcgch * 8 + scanyy + 0x4000];
            bitp1.w = bitexpand[pcgfontb * 4] + bitexpand[pcgfontr * 4] * 2 + bitexpand[pcgfontg * 4] * 4;
            bitp2.w = bitexpand[pcgfontb * 4 + 1] + bitexpand[pcgfontr * 4 + 1] * 2 + bitexpand[pcgfontg * 4 + 1] * 4;
        } else {
            bitp1.w = 0;
            bitp2.w = 0;
        }

        if(pcg_control & 2) {
            for(int i = 0; i < 4; i++) {
                if(bitp1.b[i] != 0) scan_buffer[i + 4] = bitp1.b[i];
                else scan_buffer[i + 4] = bitf1.b[i] + bitb1.b[i];
                if(bitp2.b[i] != 0) scan_buffer[i] = bitp2.b[i];
                else scan_buffer[i] = bitf2.b[i] + bitb2.b[i];
            }
        } else {
            for(int i = 0; i < 4; i++) {
                if(bitf1.b[i] != 0) scan_buffer[i + 4] = bitf1.b[i];
                else if(bitp1.b[i] != 0) scan_buffer[i + 4] = bitp1.b[i];
                else scan_buffer[i + 4] = bitb1.b[i];
                if(bitf2.b[i] != 0) scan_buffer[i] = bitf2.b[i];
                else if(bitp2.b[i] != 0) scan_buffer[i] = bitp2.b[i];
                else scan_buffer[i] = bitb2.b[i];
            }
        }

        for(int i = 0; i < 8; i++) scandata[scanx * 8 + i] = pallet[scan_buffer[i]];
        offset++;
    }
}

// ========== 初期化 ==========
void init_emulator(void)
{
    kanjiptr = 0;
    mz1r12ptr = 0;
    mz1r18ptr = 0;
    emmptr = 0;
    pcg700_ptr = 0;
    pcg700_control = 0xFF;
    pcg_control = 0;
    vram_enabled = 1;
    pcg_enabled = 0xFF;
    for(int i = 0; i < 8; i++) pallet[i] = i;
    memcpy(cgram, fontrom, 0x1000);
    memcpy(mz1r12, romslots-0x800, 0x8000);
    memcpy(emm, emmslots, 0x50000);
    // VRAM カラー初期化
    for(uint16_t offset = 0; offset < 0x800; offset++) vram[offset + 0x800] = 0x40;
}

// ========== メインスレッド (Core1) ==========
void __not_in_flash_func(main_core1)(void)
{
    volatile uint32_t bus;
    uint32_t control, address, data, response;
    uint32_t needwait = 0;

    gpio_init_mask(0xFFFFFFFF);
    gpio_set_dir_all_bits(0x00000000);
    gpio_set_dir(24, true);
    gpio_put(24, true);
    gpio_init(32);
    gpio_set_dir(32, false);

    while(1) {
        bus = gpio_get_all();
        control = bus & 0xF4000000;

        // I/O Read
        if(control == 0x54000000) {
            address = (bus & 0xFFFF00) >> 8;
            switch(address & 0xFF) {
                case 0xB9: // Kanji/Jisho
                    gpio_set_dir(32, true);
                    gpio_put(32, false);
                    needwait = 1;
                    if(kanjictl & 0x80) {
                        data = kanjirom[kanjiptr++];
                        if(kanjictl & 0x40) data = bitreverse[data];
                    } else {
                        data = jishorom[((kanjictl & 3) << 16) + dictptr++];
                        if(kanjictl & 0x40) data = bitreverse[data];
                    }
                    response = 1;
                    break;
                case 0xEA: data = mz1r18[mz1r18ptr & 0xFFFF]; mz1r18ptr++; response = 1; break;
                case 0xEB: data = mz1r18ptr & 0xFF; response = 1; break;
                case 0xF8: mz1r12ptr = 0; data = 0; response = 1; break;
                case 0xF9: data = mz1r12[mz1r12ptr & 0x7FFF]; mz1r12ptr++; if(mz1r12ptr > 0x7FFF) mz1r12ptr = 0; response = 1; break;
                case 0x03: if(emmptr > 0x4FFFF) emmptr -= 0x50000; data = emm[emmptr++]; response = 1; break;
                case 0xFE: data = pioa_read(); response = 2; break;  // PIOA データ読み出し
                default: response = 0;
            }

            if(response) {
                if(needwait) {
                    gpio_put(32, true);
                    gpio_set_dir(32, false);
                    needwait = 0;
                }
                if(response == 2) gpio_set_dir_masked(0x30, 0x30);
                else gpio_set_dir_masked(0xFF, 0xFF);
                gpio_put_masked(0xFF, data);
                while(!(gpio_get_all() & 0x80000000));
                gpio_set_dir_masked(0xFF, 0x00);
            } else {
                while(!(gpio_get_all() & 0x80000000));
            }
            continue;
        }

        // I/O Write
        else if(control == 0x94000000) {
            address = (bus & 0xFFFF00) >> 8;
            data = bus & 0xFF;
            io_write(address, data);
            while(!(gpio_get_all() & 0x40000000));
            continue;
        }

        // Memory Write
        else if(control == 0xA4000000) {
            address = (bus & 0xFFFF00) >> 8;
            data = bus & 0xFF;
            memory_write(address, data);
            while(!(gpio_get_all() & 0x40000000));
            continue;
        }

        // Memory Read
        else if((control == 0x64000000) || (control == 0x60000000)) {
            address = (bus & 0xFFFF00) >> 8;
            response = 0;
            if(address >= 0xD000) {
                if((pcg_enabled != 0xFF) && (address < 0xF000)) {
                    if(pcg_enabled & 3) data = pcg[(address - 0xD000) + ((pcg_enabled & 3) - 1) * 0x2000];
                    else data = cgram[(address - 0xD000) & 0xFFF];
                    response = 1;
                } else if(vram_enabled && address >= 0xE800) {
                    data = mz1r12[address - 0xE800];
                    response = 1;
                }
            }
            if(response) {
                gpio_set_dir_masked(0xFF, 0xFF);
                gpio_put_masked(0xFF, data);
                while(!(gpio_get_all() & 0x80000000));
                gpio_set_dir_masked(0xFF, 0x00);
            } else {
                while(!(gpio_get_all() & 0x80000000));
            }
            continue;
        }

        // Interrupt Acknowledge
        else if(control == 0xD0000000) {
            gpio_set_dir_masked(0xFF, 0xFF);
            if(pioa_enable_irq) {
                gpio_put_masked(0xFF, pioa[0]);   // 割り込みベクタ
                pioa_enable_irq = 0;
            }
            gpio_put(24, true);   // EXINT 解除
            while(!(gpio_get_all() & 0x04000000));
            gpio_set_dir_masked(0xFF, 0x00);
        }
    }
}

// ========== メイン ==========
int main()
{
    vreg_set_voltage(VREG_VOLTAGE_1_20);
    set_sys_clock_khz(300000, true);
    initVGA();

	    // ★ サウンド初期化を追加
    sound_init();
    sn_reset(&sn_l);
    sn_reset(&sn_r);

	
	multicore_launch_core1(main_core1);
    init_emulator();

    irq_set_exclusive_handler(PIO0_IRQ_0, hsync_handler);
    irq_set_enabled(PIO0_IRQ_0, true);
    pio_set_irq0_source_enabled(pio0, pis_interrupt0, true);

    gpio_set_irq_enabled_with_callback(RESET_PIN, GPIO_IRQ_EDGE_RISE, true, z80reset);

    while(1) {

    sound_task();
    	
        if(flash_command) {
            switch(flash_command & 0xF0000000) {
                case 0x10000000: memcpy(mz1r12, romslots + (flash_command & 0x3F) * 0x8000, 0x8000); break;
                case 0x20000000:
                    for(uint32_t i = 0; i < 0x8000; i += 4096) {
                        uint32_t ints = save_and_disable_interrupts();
                        flash_range_erase(i + 0x80000 + (flash_command & 0x3F) * 0x8000, 4096);
                        restore_interrupts(ints);
                    }
                    for(uint32_t i = 0; i < 0x8000; i += 4096) {
                        uint32_t ints = save_and_disable_interrupts();
                        flash_range_program(i + 0x80000 + (flash_command & 0x3F) * 0x8000, (const uint8_t *)(mz1r12 + i), 4096);
                        restore_interrupts(ints);
                    }
                    break;
                case 0x30000000: memcpy(emm, emmslots + (flash_command & 0x1F) * 0x50000, 0x50000); break;
                case 0x40000000:
                    for(uint32_t i = 0; i < 0x50000; i += 4096) {
                        uint32_t ints = save_and_disable_interrupts();
                        flash_range_erase(i + 0x280000 + (flash_command & 0x1F) * 0x50000, 4096);
                        restore_interrupts(ints);
                    }
                    for(uint32_t i = 0; i < 0x50000; i += 4096) {
                        uint32_t ints = save_and_disable_interrupts();
                        flash_range_program(i + 0x280000 + (flash_command & 0x1F) * 0x50000, (const uint8_t *)(emm + i), 4096);
                        restore_interrupts(ints);
                    }
                    break;
            }
            flash_command = 0;
        }

        // EXINT 制御 (割り込み要求があれば Low にする)
        if(pioa_enable_irq) {
            gpio_put(24, false);
        }
    }
}