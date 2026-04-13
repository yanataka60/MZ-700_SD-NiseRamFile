# MZ-700_SD+偽RAMFILE複合ボード

![MZ-700_SD](https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/blob/main/JPEG/TITLE.JPG)

しっぽいいんちょさんが作られた「偽RAMFILE for MZ-1500」を元にしてMZ-700_SDを合体させてボードです。

オマケとしてMZ-1500のサウンド機能を付加してMZ-1500用アプリケーションも楽しめるようにしてみました。あくまでオマケですので完全にMZ-1500と同等になるかは未検証です。

以下の機能があります。

・MZ-700_SDの起動及びMZ-700_SDの機能

・EMM0からの起動(ただし、EMM0にHu-BASICの起動ディスクイメージがある場合のみ)

・EMM0エミュレータ(320KByte)

・漢字ROMボードエミュレータ

・MZ-700のテキスト出力をエミュレートしてVGA出力

・VGA出力される出力にMZ-1500相当のPCG機能

・VGA出力される出力にPCG-700相当のPCG機能

・MZ-1500相当のサウンド機能

・EXT-ROM領域のRAM化(MZ-700_SDからEXT-ROM領域にEXT-ROMのLOADが可能です)

MZ-700_SD: https://github.com/yanataka60/MZ-2000_SD

なおこの基板は、しっぽいいんちょさんの「偽1500 for MZ-700」のnise1500.uf2を書き込めば「偽1500 for MZ-700」になります。

どちらかのuf2ファイルを選んで書き込んでください。

偽1500 for MZ-700:https://github.com/shippoiincho/nise1500

## 回路図
　KiCadフォルダ内のMZ-700_SD+NRF.pdfを参照してください。

[回路図](https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/blob/main/Kiacd/MZ-2000_SD%2BNRF.pdf)

![MZ-700_SD](https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/blob/main/Kiacd/MZ-2000_SD%2BNRF_1.jpg)

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

![MicroSD Card Adapter1](https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

## 偽RAMFILE for MZ-700の書込み
　RP2350Bフォルダにあるniseramfile.uf2をRP2350Bマイコンボードに書き込みます。

　RP2350BのBOOTボタンを押しながらUSB-Cケーブルを接続するとパソコンがUSBメディアとして認識しますのでniseramfile.uf2をドロップすると自動的に書き込まれます。

　書き込みが終了するとパソコンからはUSBとして見えなくなりますのでそうなったらケーブルを抜いて終了です。

## MZ-700_SD BOOT PROGRAMをMZ-1R12 SRAMメモリ 0番バックアップスロットへ書き込み
　MZ-700_SDリポジトリEMMフォルダ内のBOOT_A_LOADER.binをMZ-1R12 SRAMメモリ 0番バックアップスロットへ書き込んでください。

https://github.com/yanataka60/MZ-2000_SD/blob/main/EMM/BOOT_A_LOADER.bin

　書き込みにはpicotool.exeが必要となります。以下のウェブページ右側の「Releases」からダウンロードできます。

https://github.com/raspberrypi/pico-sdk-tools

```
picotool.exe load -v -x BOOT_A_LOADER.bin  -t bin -o 0x10080000
```

　また、EMM1に起動可能な内容(HuBASIC起動イメージ)があればEMMからの起動が可能です。

　EMMの内容をチェックしていないのでEMMが起動可能な内容(HuBASIC起動イメージ)でなかった場合には暴走しますのでご注意ください。

　EMMから起動するためには、MZ-2000_SDリポジトリEMMフォルダ内の「@BOOT-EMM1.MZT」をSDカードにコピーしておく必要があります。

　EMM1からの起動方法は、「/」キーとテンキーの「1」を同時に押しながら電源ON時又はIPLリセットすることで「EMM1」のHuBASICから起動させることが出来ます。

## FONTファイルの書込み
　VGA出力を有効とするためにはMZ-2000のフォントをRP2350Bに書き込む必要があります。

　MZ-2000はソフトウェア的にフォントを取り出すすべがありません。頑張って作ってください。

　私はオーナーズマニュアルのASCIIコード表を見ながら作成しました。

　書き込みはpicotoolを使います。

```
picotool.exe load -v -x font.rom  -t bin -o 0x1001f000
```

## Arduinoプログラム
　MZ-80K_SDを参照してください。

https://github.com/yanataka60/MZ-2000_SD?tab=readme-ov-file#arduino%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0-1

## 拡張機能の使い方
### MZ-2000_SDの起動
　MZ-2000_SDの起動方法と同じです。「/」キーを押しながら電源投入又はIPL RESETしてください。

### EMM1エミュレータ
　320KByteのEMM1として機能します。バッテリーバックアップ機能はなく、電源断で内容は消失します。

　ただし、バックアップ用のSlotが32個用意されているので電源断前にSlotに退避しておくことが可能です。

　また、Slot0の内容は電源投入又はIPL RESETした時にEMM1に自動的にコピーされるのであたかもバッテリーバックアップされていたかのような使い方が出来ます。

　EMMとSlotとのやり取りはI/Oポートから指示します。

#### SlotxxからEMM1への復帰
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Ch|W|指定したSlot番号(0～31)のSlotの内容をEMM1に復帰|

#### EMM1からSlotxxへの退避
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Dh|W|指定したSlot番号(0～31)のSlotへEMM1の内容を退避|

HuBASICからは以下のようになります。

```
OUT &H8C,0
```

```
OUT &H8D,0
```

　また、EMM1に起動可能な内容(HuBASIC起動イメージ)があればEMMからの起動が可能です。

　EMMの内容をチェックしていないのでEMMが起動可能な内容(HuBASIC起動イメージ)でなかった場合には暴走しますのでご注意ください。

　EMM1からの起動方法は、「/」キーとテンキーの「1」を同時に押しながら電源ON時又はIPLリセットすることで「EMM1」のHuBASICから起動させることが出来ます。

　EMM1へのHuBASIC起動ディスクイメージ作成は、DISK版HuBASICのUtilityからEMM1へのCOPY ALLで作ってください。

　また、Emulatorで作られたEMMイメージを登録する場合はpicotoolから以下のようにします。

```
picotool.exe load -v -x EMM_image.bin  -t bin -o 0x10280000
```

　MZ-1500_SD+NiseRamFileの様にEMMMENUも対応させたいと思います。

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

### FONT変更機能
一時的にFONTを変更することが出来ます。電源断又はIPL RESETで元に戻ります。以下VGA出力機能に関する設定は電源断又はIPL RESETですべて元に戻ります

キャラクタデータは1キャラクタ8Byteの普通のフォーマットです。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|71h|W|データ書き込み:キャラクタコード+1|
|72h|W|キャラクタコード指定|

例)

```
OUT@$72,41:OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF,OUT@$71,$FF
```
### FONTカラー設定
FONTのカラーを指定できます。上位4Bitがキャラクタ色(前景色)、下位4Bitが背景色になります。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|79h|W|キャラクタ色(前景色)を上位4Bitで背景色を下位4Bitで指定する:キャラクタコード+1|
|7Ah|W|キャラクタコード指定|

例)キャラクタ「A」がGreenで表示されます。

```
OUT@$7A,41:OUT@$79,$40
```

### PCG定義
MZ-1500のPCGと同様の機能です。

1キャラクタ8Byteのキャラクタデータを3プレーン(合計24Byte)に書くことで1Dotごとに色指定が可能です。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|61h|W|キャラクタコード指定|
|62h|W|書き込みバンク指定(Blue:1,Red:2,Green:3)|
|63h|W|データ書き込み:キャラクタコード+1|

### PCGの表示切替、FONTテキストとの優先順位変更
MZ-1500のPCGと同様の機能です。

Bit0でPCG表示の切り替え、Bit1でテキストとPCGの優先順位が変更できます。

|67h|W|Bit1 優先順位 0:テキスト文字色＞PCG＞テキスト背景色<br>　　　　　　1:PCG＞テキスト<br>Bit0 PCG表示  0:PCGを表示しない<br>　　　　　　1:PCGを表示する|

### テキストパレット設定
テキストの色について上位4Bitで表す色コードを下位4Bitで表す色に変えることが出来ます。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|68h|W|上位4Bitで表す色コードを下位4Bitで表す色で表示する<br>　起動時設定<br>　　0x00<br>　　0x11<br>　　0x22<br>　　0x33<br>　　0x44<br>　　0x55<br>　　0x66<br>　　0x77|

例)起動時WhiteのテキストをGreenに変える

```
OUT@$68,$74
```

### グラフィックパレット設定
テキストの色とは別にグラフィックの色について上位4Bitで表す色コードを下位4Bitで表す色に変えることが出来ます。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|69h|W|上位4Bitで表す色コードを下位4Bitで表す色で表示する<br>　起動時設定<br>　　0x00<br>　　0x11<br>　　0x22<br>　　0x33<br>　　0x44<br>　　0x55<br>　　0x66<br>　　0x77|

例)色指定7のグラフィックをGreenに変える

```
OUT@$69,$74
```

### グラフィックとテキストの優先順位変更
MZ-2000ではI/Oポート$F5によりテキストとグラフィックの優先順位を変更可能ですが、こちらを使うことで色ごとに優先順位を変更することが出来ます。

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|6Ah|W|上位4Bitで表す色コードを0Bitが1の時、グラフィック優先、0の時テキスト優先|

## MZ-80B、MZ-2500の80Bモードでの使用について
　MZ-2000_SD機能、EMM1エミュレータ、漢字ROMボードエミュレータはMZ-80B、MZ-2500の80Bモードでも問題なく動作しますが、VGA出力機能はVRAM、GRAMのアクセス方法がMZ-2000と異なるためまともな表示となりません。

## SAMPLE
### DEEP SCAN カラー化
　キャラクタに色を付けるサンプルプログラムを作ってみました。

　えむこまさんが公開されているMZ-80K/C版からの移植DEEP SCAN用に作ってみました。

https://github.com/mkomakonkon/MZ-2000/tree/master/IO/198005_DEEP_SCAN

　フォントファイルを入れ替える必要があるためEmuz-2200用とされていましたがMZ-2000_SD+偽RAMFILE複合ボードなら遊ぶことが出来ます。

　えむこまさんのサイトからダウンロードしたDEEP SCAN.zipを解凍するとFONT.ROMというファイルが含まれていますのでSampleフォルダのDEEP SCANフォルダにある「SET COLOR DEEP SCAN.mzt」の後ろにバイナリエディタなどでくっつけて一つのMZTファイルとします。

　また、DEEP SCANの実行ファイルであるDEEP SCAN.wavはDumpList Editorなどを使ってMZTファイル化してください。(実行アドレスを2000hに指定してMZTファイル化すると便利です)

　後はDEEP SCAN.MZTを実行する前にSET COLOR DEEP SCAN.mztを実行するだけです。

### グリーンモニター化
　カラーパレット機能を設定してキャラクタ、グラフィックともグリーン一色表示に変える「GREEN-MONITOR.mzt」をSampleフォルダのGREEN MONITORフォルダに置きました。

　MZ-2000_SD起動直後に実行すれば以降はグリーンモニターとなります。

　GVRAMを切り替えて表示するパラパラアニメ等にお使いください。

## おまけ
　グラフィックボードを装着していないMZ-2000でもVGA出力からカラーグラフィックが正常に利用できるバージョンを作ってみました。

　uf2ファイル

https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/blob/main/OMAKE/RP2350B/niseramfile_No_GVRAM.uf2

　ソースファイル

https://github.com/yanataka60/MZ-2000_SD-NiseRamFile-/tree/main/OMAKE/Source(No_GVRAM)

### 使用上の注意
　グラフィックボートが装着されていないこと。

　プレーン1のみのグラフィックボートが装着されている場合も取り外してください。

　MZ-2200もグラフィックボートを取り外せば使えます。

　MZ-80B、MZ-2500(80B、2000、2500モードとも)では正常に動作しません。通常のバージョンを使ってください。

## 開発環境、使用ライブラリなど
　開発環境は、Visual Studio Codeです。

　VGAライブラリは以下を使用しています。

- [VGA ライブラリ(一部改変)](https://github.com/vha3/Hunter-Adams-RP2040-Demos/tree/master/VGA_Graphics)

## 謝辞
　素晴らしい拡張モジュールを開発し、自由に改変・公開を快く承諾してくださったしっぽいいんちょさん、ありがとうございました。

