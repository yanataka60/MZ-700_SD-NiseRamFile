# MZ-700_SD+偽RAMFILE複合ボード

![MZ-700_SD](https://github.com/yanataka60/MZ-700_SD-NiseRamFile/blob/main/JPEG/TITLE.JPG)

　しっぽいいんちょさんが作られた「偽RAMFILE for MZ-1500」を元にしてMZ-700_SDを合体させてボードです。

　オマケとしてMZ-1500のサウンド機能を付加してMZ-1500用ゲームのサウンドも鳴るようにしてみました。あくまでオマケですので完全にMZ-1500と同等になるかは未検証です。

　以下の機能があります。

・MZ-700_SDの起動及びMZ-700_SDの機能

・EMM0からの起動(ただし、EMM0にHu-BASICの起動ディスクイメージがある場合のみ)

・EMM0エミュレータ(320KByte)

・漢字ROMボードエミュレータ

・MZ-700のテキスト出力をエミュレートしてVGA出力

・VGA出力される出力にMZ-1500相当のPCG機能、パレット機能

・VGA出力される出力にPCG-700相当のPCG機能

・MZ-1500相当のサウンドエミュレート(SN76489x2、8253)

・EXT-ROM領域(E800h～FFFFh)のRAM化(MZ-700_SDからEXT-ROM領域にEXT-ROMのLOADが可能です)

MZ-700_SD: https://github.com/yanataka60/MZ-700_SD

　「偽RAMFILE for MZ-1500」にはMZ-1R12 SRAMメモリエミュレータの機能がありますが、MZ-700_SDの起動用に使用しているのでMZ-1R12 SRAMメモリエミュレータとしては使用できません。

　なおこの基板は、しっぽいいんちょさんの「偽1500 for MZ-700」のnise1500.uf2を書き込めば「偽1500 for MZ-700」になります。

　どちらかのuf2ファイルを選んで書き込んでください。

偽1500 for MZ-700:https://github.com/shippoiincho/nise1500

## 回路図
　KiCadフォルダ内のMZ-700_SD+NRF.pdfを参照してください。

[回路図](https://github.com/yanataka60/MZ-700_SD-NiseRamFile/blob/main/KiCad/MZ-700_SD%2BNRF.pdf)

![MZ-700_SD](https://github.com/yanataka60/MZ-700_SD-NiseRamFile/blob/main/KiCad/MZ-700_SD%2BNRF_1.jpg)

|番号|品名|数量|備考|
| ------------ | ------------ | ------------ | ------------ |
||J2、J5のいずれか|||
|J2|Micro_SD_Card_Kit|1|秋月電子通商 AE-microSD-LLCNV (注2)|
|J5|MicroSD Card Adapter|1|Arduino等に使われる5V電源に対応したもの(注4)|
|J3|コネクタ 2Pin|1|ピンヘッダで代用するときはGNDと間違えないよう1Pinで5Vだけにしたほうが良い|
|J4|DCジャック|1||
|J6,J7|ピンソケット2x15Pin|2|RP2350Bマイコンボード用,秋月電子通商 FHU-2x42SGなど|
|J8|VGA用基板ソケット 3列15ピン|1|マルツ DJ-VGA14.5など (注1)|
|J9|RCAジャック|1|秋月電子通商 MJ-523など|
|S1|3Pスライドスイッチ|1|秋月電子通商 SS12D01G4など|
|U1|74LS04|1||
|U3|8255|1||
|U4|Arduino_Pro_Mini_5V|1|Atmega328版を使用 168版は不可。(注3)|
|U6|74LS30|1||
||RP2350Bボード(Raspberry Pi Pico 2)|1|Amazon WA00021 RP2350Bマイコンボードなど|
|C1-C3,C5|積層セラミックコンデンサ 0.1uF|4||
|C6|電解コンデンサ 16v100uF|1||
|R1-R3|カーボン抵抗 330Ω|3||
|R4|カーボン抵抗 1kΩ|1||
||ピンヘッダ|2Pin分|Arduino_Pro_MiniにはA4、A5用のピンヘッダが付いていないため別途調達が必要です 秋月電子通商 PH-1x40SGなど|
||ピンソケット(任意)|26Pin分|Arduino_Pro_Miniを取り外し可能としたい場合に調達します 秋月電子通商 FHU-1x42SGなど|

　　　注1)VGA用基板ソケットには、ピン間隔の異なるものがあるようです。マルツ DJ-VGA14.5ではないものを購入する場合はこちらで寸法を確認してください。

　　　https://www.marutsu.co.jp/contents/shop/marutsu/datasheet/DJ-VGA14.5.pdf

　　　注2)秋月電子通商　AE-microSD-LLCNVのJ1ジャンパはショートしてください。

　　　注3)Arduino Pro MiniはA4、A5ピンも使っています。

　　　注4)MicroSD Card Adapterを使う場合

　　　　　J6に取り付けます。

　MicroSD Card Adapterについているピンヘッダを除去してハンダ付けするのが一番確実ですが、J6の穴にMicroSD Card Adapterをぴったりと押しつけ、裏から多めにハンダを流し込むことでハンダ付けをする方法もあります。なお、この方法の時にはしっかりハンダ付けが出来たかテスターで導通を確認しておいた方が安心です。

　ハンダ付けに自信のない方はJ5の秋月電子通商　AE-microSD-LLCNVをお使いください。AE-microSD-LLCNVならパワーLED、アクセスLEDが付いています。

![MicroSD Card Adapter1](https://github.com/yanataka60/MZ-700_SD-NiseRamFile/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

## 偽RAMFILE for MZ-700の書込み
　RP2350Bフォルダにあるniseramfile.uf2をRP2350Bマイコンボードに書き込みます。

　RP2350BのBOOTボタンを押しながらUSB-Cケーブルを接続するとパソコンがUSBメディアとして認識しますのでniseramfile.uf2をドロップすると自動的に書き込まれます。

　書き込みが終了するとパソコンからはUSBとして見えなくなりますのでそうなったらケーブルを抜いて終了です。

## MZ-700_SD用ROMプログラムの書き込み
　MZ-700_SD/EMMフォルダ内のFD_rom1.bin又はFD_rom.binをRP2350BのフラッシュROMへ書き込みます。

https://github.com/yanataka60/MZ-700_SD/blob/main/EMM/FD_rom.BIN

　書き込みにはpicotool.exeが必要となります。以下のウェブページ右側の「Releases」からダウンロードできます。

https://github.com/raspberrypi/pico-sdk-tools

```
picotool.exe load -v -x FD_rom1.bin  -t bin -o 0x10080000
```

　また、EMM0に起動可能な内容(HuBASIC起動イメージ)があればEMMからの起動が可能です。

　EMMの内容をチェックしていないのでEMMが起動可能な内容(HuBASIC起動イメージ)でなかった場合には暴走しますのでご注意ください。

　EMM0からの起動は、MONITORから「FDE0」コマンドで起動できます。

## FONTファイルの書込み
　VGA出力を有効とするためにはMZ-700のフォントをRP2350Bに書き込む必要があります。

　MZ-700はソフトウェア的にフォントを取り出すすべがありませんが、疑似的に作り出す又はソフトウェアで読み出せるMZ-1500のFONTを使うなどの方法があります。Webで検索して作成してください。

　書き込みはpicotoolを使います。

```
picotool.exe load -v -x font.rom  -t bin -o 0x1001f000
```

## Arduinoプログラム
　MZ-80K_SDを参照してください。

https://github.com/yanataka60/MZ80K_SD?tab=readme-ov-file#arduino%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0

## 拡張機能の使い方
### MZ-700_SD(MZ-80K_SD)の起動
　MZ-700_SD(MZ-80K_SD)の起動方法、使用方法と同じです。

MZ-700_SD:https://github.com/yanataka60/MZ-700_SD

MZ-80K_SD:https://github.com/yanataka60/MZ80K_SD

### EMM0エミュレータ
　320KByteのEMM0として機能します。バッテリーバックアップ機能はなく、電源断で内容は消失します。

　ただし、バックアップ用のSlotが32個用意されているので電源断前にSlotに退避しておくことが可能です。

　また、Slot0の内容は電源投入又はIPL RESETした時にEMM0に自動的にコピーされるのであたかもバッテリーバックアップされていたかのような使い方が出来ます。

　EMMとSlotとのやり取りはI/Oポートから指示します。

#### SlotxxからEMM0への復帰
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Ch|W|指定したSlot番号(0～31)のSlotの内容をEMM0に復帰|

#### EMM0からSlotxxへの退避
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Dh|W|指定したSlot番号(0～31)のSlotへEMM0の内容を退避|

HuBASICからは以下のようになります。

```
OUT &H8C,0
```

```
OUT &H8D,0
```

　「EMM0」に起動可能なMZ-700用HuBASICが存在している場合、コマンド「FDE0」を実行することで「EMM0」のMZ-700用HuBASICから起動可能です。

　なお、EMMの00000番地が「01h」でなければEMMからの起動はせずにコマンド待ちに戻りますが、00000番地以降に異常があってもチェックはしていないので最悪暴走します。

　MZ-700用HuBASICは、テープ版しかなくそのままではEMMにHuBASICの起動イメージを作成することが出来ません。

　BouKiCHiさんのHuDiskなどを使いMZ-700用HuBASICの起動ディスクイメージを作成したうえでEMMMENUのEMMLOADでEMMに書き込む必要があります。

　EMMイメージを登録する場合はpicotoolから以下のようにします。

```
picotool.exe load -v -x EMM_image.bin  -t bin -o 0x10280000
```

### 漢字・辞書ROM MZ-1R13
　漢字・辞書ROM MZ-1R13から抽出したデータを登録します。

　抽出にはGET1R13を使いました。

http://fukui.s17.xrea.com/retro/mz2080b/mzgetkrom.html

　出来上がったファイルをpicotoolで登録します。

```
picotool.exe load -v -x MZ_1R13_DIC.ROM -t bin -o 0x10040000
```

```
picotool.exe load -v -x MZ_1R13.ROM  -t bin -o 0x10020000
```

## MZ-80K用ゲーム(アプリケーション)の実行
　FDL、FDコマンドでLOAD実行が可能です。アプリケーション内でのLOAD、SAVEには本体内ROMの書き換え、もしくはアプリケーションの書き換えが必要です。

　また、キーボードの違いによりそのまま動かないことがあります。

　詳しくは、MZ-80K_SDを参照してください。

https://github.com/yanataka60/MZ80K_SD

## MZ-700用ゲーム(アプリケーション)の実行
　FDL、FDコマンドでLOAD実行が可能です。アプリケーション内でのLOAD、SAVEにはアプリケーションを対応させる必要がある場合があります。

　詳しくは、MZ-80K_SDを参照してください。

https://github.com/yanataka60/MZ80K_SD

## MZ-1500用ゲーム(アプリケーション)の実行
　MZ-1500用ゲーム(アプリケーション)が動作するかもしれないのはあくまでもオマケです。動作したらラッキーぐらいでお願いします。

　なお、QD用ソフトは、事前にMZTファイル化しておいてください。

　また、アプリケーション内でLOAD、SAVEするにはMZ-1500_SDでアプリケーション内でのLOAD、SAVEに対応している必要があります。

　次の段階で試してみてください。

#### ①FDL、FDコマンドでLOAD実行。
　①で動いたもの

　　いぬふとさんのゲーム、PACKMAN、ICE BLOCK

#### ②多段LOADの場合は、FDL、FDコマンドでLOAD実行(PCG定義)。リセットして２段目をFDL、FDコマンドでLOAD実行(ゲーム本体)。
　②で動いたもの

　　DOORDOORmk2、FLAPPY、RALLY-X、ヴォルガード、DIGDUG、ドルアーガの塔、MAPPY、GALAGA

#### ③FDL、FDコマンドで1Z-009B_LauncherをLOAD実行し、1Z-009B_LauncherからFDL、FDコマンドでLOAD実行。
　③で動いたもの

　　サンダーフォース、BASIC MZ-5Z001(もしかしたら④の方が良いのかも)

#### ④FDL、FDコマンドで1Z-009B_LauncherをLOAD実行後、1Z-009B_LauncherからMZ-1500用EXT-ROM(E800h～FFFFh、実行アドレスE800h)をLOAD実行、MキーでMONITOR 9Z-502Mを起動したら「J0000」を実行して1Z-009B_Launcherに戻り、目的のアプリケーションをFDL、FDコマンドでLOAD実行。
　④で動いたもの

　　今のところ④が必要となったものには出会っていません。もしかしたらBASIC MZ-5Z001の機能のうち、EXT-ROMを必要とするものがあるかもしれません。

### 1Z-009B_Launcherの作り方
　1Z-009B_Launcherフォルダにある1Z-009B_SD.mzt(2531Byte)の後ろにMZ-1500実機から抽出した1Z-009B MONITOR(0000h～0FFFh)をバイナリエディタなどで連結して保存してください。

　6627Byteのファイルになります。

### MZ-1500用EXT-ROMファイルの作り方
　MZ-1500実機からEXT-ROM(E800h～FFFFh)までを抽出してバイナリファイルとしたうえでヘッダを付加してmztファイルとしてください。

　この時、実行アドレスをE800hとしておきます。

## 開発環境、使用ライブラリなど
　開発環境は、Visual Studio Codeです。

　VGAライブラリは以下を使用しています。

- [VGA ライブラリ(一部改変)](https://github.com/vha3/Hunter-Adams-RP2040-Demos/tree/master/VGA_Graphics)

## 謝辞
　素晴らしい拡張モジュールを開発し、自由に改変・公開を快く承諾してくださったしっぽいいんちょさん、ありがとうございました。

