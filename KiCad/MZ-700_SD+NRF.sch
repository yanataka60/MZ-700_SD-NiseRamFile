EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 17000 11000
encoding utf-8
Sheet 1 1
Title "MZ-700_SD+NiseRamFile"
Date "2022-01-14"
Rev "Rev1.5"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino:Arduino_Pro_Mini U4
U 1 1 61A254A8
P 10650 4700
F 0 "U4" H 10650 5589 60  0000 C CNN
F 1 "Arduino_Pro_Mini_5V" H 10650 5483 60  0000 C CNN
F 2 "MZ80k_SD:Arduino_Pro_Mini" H 11450 3950 60  0001 C CNN
F 3 "https://www.sparkfun.com/products/11113" H 10850 3500 60  0001 C CNN
	1    10650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2900 3150 2900
Wire Wire Line
	2100 3000 3150 3000
Wire Wire Line
	2100 3100 3150 3100
Wire Wire Line
	2100 3200 3150 3200
Wire Wire Line
	1600 3200 1350 3200
Wire Wire Line
	1600 3400 1250 3400
Wire Wire Line
	1250 3400 1250 6700
Wire Wire Line
	1250 6700 5150 6700
Wire Wire Line
	1600 3600 1150 3600
Wire Wire Line
	1150 3600 1150 6800
Wire Wire Line
	1600 3800 1050 3800
Wire Wire Line
	1050 3800 1050 6900
Wire Wire Line
	2100 4300 3000 4300
Wire Wire Line
	2100 4600 2900 4600
Wire Wire Line
	2100 4700 2800 4700
Wire Wire Line
	2100 4800 2700 4800
Wire Wire Line
	2100 4900 2600 4900
Wire Wire Line
	2100 5000 2500 5000
Wire Wire Line
	2100 5100 2400 5100
Wire Wire Line
	2100 5200 2300 5200
Wire Wire Line
	2100 5300 2200 5300
Wire Wire Line
	1600 4400 950  4400
Wire Wire Line
	950  4400 950  7000
Wire Wire Line
	950  7000 7950 7000
Wire Wire Line
	7950 7000 7950 3600
$Comp
L power:GND #PWR01
U 1 1 61CAF7EF
P 800 4700
F 0 "#PWR01" H 800 4450 50  0001 C CNN
F 1 "GND" H 805 4527 50  0000 C CNN
F 2 "" H 800 4700 50  0001 C CNN
F 3 "" H 800 4700 50  0001 C CNN
	1    800  4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4500 1450 4500
Wire Wire Line
	800  4500 800  4700
Wire Wire Line
	7950 3600 8150 3600
Wire Wire Line
	3000 4300 3000 4500
$Comp
L Interface:8255 U3
U 1 1 618A36EE
P 8850 4900
F 0 "U3" H 8450 6400 50  0000 C CNN
F 1 "8255" H 9250 6400 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 8850 5200 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 8850 5200 50  0001 C CNN
	1    8850 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 61F2D5C6
P 8350 6550
F 0 "C3" V 8200 6650 50  0000 C CNN
F 1 "0.1uF" V 8200 6400 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 8388 6400 50  0001 C CNN
F 3 "~" H 8350 6550 50  0001 C CNN
	1    8350 6550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 61F38F70
P 8850 6600
F 0 "#PWR08" H 8850 6350 50  0001 C CNN
F 1 "GND" H 8855 6427 50  0000 C CNN
F 2 "" H 8850 6600 50  0001 C CNN
F 3 "" H 8850 6600 50  0001 C CNN
	1    8850 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 6550 8850 6550
Wire Wire Line
	8850 6550 8850 6600
Wire Wire Line
	8850 6500 8850 6550
Connection ~ 8850 6550
Wire Wire Line
	8200 6550 8100 6550
Wire Wire Line
	8100 6550 8100 3300
Wire Wire Line
	8100 3300 8850 3300
$Comp
L power:+5V #PWR07
U 1 1 61F63930
P 8850 3300
F 0 "#PWR07" H 8850 3150 50  0001 C CNN
F 1 "+5V" H 8865 3473 50  0000 C CNN
F 2 "" H 8850 3300 50  0001 C CNN
F 3 "" H 8850 3300 50  0001 C CNN
	1    8850 3300
	1    0    0    -1  
$EndComp
Connection ~ 8850 3300
Wire Wire Line
	11600 6100 11600 4800
Wire Wire Line
	11600 4800 11250 4800
Wire Wire Line
	9550 5600 9700 5600
Wire Wire Line
	9700 5600 9700 6200
Wire Wire Line
	9700 6200 11700 6200
Wire Wire Line
	11700 6200 11700 4700
Wire Wire Line
	11700 4700 11250 4700
Wire Wire Line
	11700 3600 11700 4600
Wire Wire Line
	11700 4600 11250 4600
Wire Wire Line
	11600 3700 11600 4500
Wire Wire Line
	11600 4500 11250 4500
Wire Wire Line
	9900 3800 9900 5700
Wire Wire Line
	9900 5700 10750 5700
Wire Wire Line
	10750 5700 10750 5600
Wire Wire Line
	9800 3900 9800 5800
Wire Wire Line
	9800 5800 10850 5800
Wire Wire Line
	10850 5800 10850 5600
$Comp
L power:GND #PWR09
U 1 1 621A9C99
P 11350 5400
F 0 "#PWR09" H 11350 5150 50  0001 C CNN
F 1 "GND" H 11355 5227 50  0000 C CNN
F 2 "" H 11350 5400 50  0001 C CNN
F 3 "" H 11350 5400 50  0001 C CNN
	1    11350 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 4200 11350 4200
Wire Wire Line
	11350 4200 11350 5400
$Comp
L power:+5V #PWR010
U 1 1 621E99AD
P 11450 4100
F 0 "#PWR010" H 11450 3950 50  0001 C CNN
F 1 "+5V" H 11465 4273 50  0000 C CNN
F 2 "" H 11450 4100 50  0001 C CNN
F 3 "" H 11450 4100 50  0001 C CNN
	1    11450 4100
	1    0    0    -1  
$EndComp
NoConn ~ 9550 4000
NoConn ~ 9550 4100
NoConn ~ 9550 4200
NoConn ~ 9550 4300
NoConn ~ 9550 5400
NoConn ~ 9550 5500
NoConn ~ 9550 5700
NoConn ~ 9550 5800
NoConn ~ 9550 5900
NoConn ~ 9550 6000
NoConn ~ 1600 2900
NoConn ~ 1600 4200
NoConn ~ 1600 4300
NoConn ~ 2100 4500
NoConn ~ 11250 4100
NoConn ~ 11250 4300
NoConn ~ 10650 5600
NoConn ~ 10550 5600
NoConn ~ 10050 4400
NoConn ~ 10050 4200
NoConn ~ 10050 4100
Wire Wire Line
	11250 4400 11450 4400
Wire Wire Line
	11450 4400 11450 4100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 626B92AA
P 9950 2200
F 0 "#FLG0101" H 9950 2275 50  0001 C CNN
F 1 "PWR_FLAG" H 9950 2373 50  0000 C CNN
F 2 "" H 9950 2200 50  0001 C CNN
F 3 "~" H 9950 2200 50  0001 C CNN
	1    9950 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Jack-DC J4
U 1 1 6287BB15
P 8100 1500
F 0 "J4" H 7850 1750 50  0000 C CNN
F 1 "EXT 5V" H 8157 1734 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 8150 1460 50  0001 C CNN
F 3 "~" H 8150 1460 50  0001 C CNN
	1    8100 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 6287C72E
P 7950 2000
F 0 "J3" H 8050 2100 50  0000 C CNN
F 1 "INT VCC" H 7868 2126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 7950 2000 50  0001 C CNN
F 3 "~" H 7950 2000 50  0001 C CNN
	1    7950 2000
	-1   0    0    -1  
$EndComp
NoConn ~ 8150 2100
$Comp
L power:+5V #PWR015
U 1 1 62901E30
P 9650 2100
F 0 "#PWR015" H 9650 1950 50  0001 C CNN
F 1 "+5V" H 9665 2273 50  0000 C CNN
F 2 "" H 9650 2100 50  0001 C CNN
F 3 "" H 9650 2100 50  0001 C CNN
	1    9650 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2100 9650 2200
Wire Wire Line
	9650 2200 9950 2200
Connection ~ 9650 2200
$Comp
L Memory_RAM2:SLIDE_SWITCH_3P S1
U 1 1 62949B85
P 9100 1800
F 0 "S1" H 9100 1865 50  0000 C CNN
F 1 "INT/EXT" H 9100 1774 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9100 1825 50  0001 C CNN
F 3 "" H 9100 1825 50  0001 C CNN
	1    9100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2150 9100 2200
Wire Wire Line
	9100 2200 9650 2200
Wire Wire Line
	8150 2000 8900 2000
$Comp
L power:GND #PWR0102
U 1 1 62BDE6ED
P 8500 1650
F 0 "#PWR0102" H 8500 1400 50  0001 C CNN
F 1 "GND" H 8505 1477 50  0000 C CNN
F 2 "" H 8500 1650 50  0001 C CNN
F 3 "" H 8500 1650 50  0001 C CNN
	1    8500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1600 8500 1600
Wire Wire Line
	8500 1600 8500 1650
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 61ABAF01
P 1900 4100
F 0 "J1" H 1950 2675 50  0000 C CNN
F 1 "MZ-80K BUS" H 1950 2766 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Horizontal" H 1900 4100 50  0001 C CNN
F 3 "~" H 1900 4100 50  0001 C CNN
	1    1900 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8400 1400 9500 1400
Wire Wire Line
	9500 1400 9500 2000
Wire Wire Line
	9500 2000 9300 2000
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61C4340B
P 800 4300
F 0 "#FLG01" H 800 4375 50  0001 C CNN
F 1 "PWR_FLAG" H 800 4473 50  0000 C CNN
F 2 "" H 800 4300 50  0001 C CNN
F 3 "~" H 800 4300 50  0001 C CNN
	1    800  4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  4300 800  4500
Connection ~ 800  4500
$Comp
L Device:CP1 C6
U 1 1 61AFFCD6
P 9650 2350
F 0 "C6" H 9765 2396 50  0000 L CNN
F 1 "100uF" H 9765 2305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 9650 2350 50  0001 C CNN
F 3 "~" H 9650 2350 50  0001 C CNN
	1    9650 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 61B04D1B
P 9650 2500
F 0 "#PWR013" H 9650 2250 50  0001 C CNN
F 1 "GND" H 9655 2327 50  0000 C CNN
F 2 "" H 9650 2500 50  0001 C CNN
F 3 "" H 9650 2500 50  0001 C CNN
	1    9650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 2100 11250 2750
Wire Wire Line
	11400 2100 11250 2100
$Comp
L power:GND #PWR012
U 1 1 625DAB5A
P 11250 2750
F 0 "#PWR012" H 11250 2500 50  0001 C CNN
F 1 "GND" H 11255 2577 50  0000 C CNN
F 2 "" H 11250 2750 50  0001 C CNN
F 3 "" H 11250 2750 50  0001 C CNN
	1    11250 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11250 1800 11400 1800
Wire Wire Line
	11250 1650 11250 1800
$Comp
L power:+5V #PWR011
U 1 1 625CD0DA
P 11250 1650
F 0 "#PWR011" H 11250 1500 50  0001 C CNN
F 1 "+5V" H 11265 1823 50  0000 C CNN
F 2 "" H 11250 1650 50  0001 C CNN
F 3 "" H 11250 1650 50  0001 C CNN
	1    11250 1650
	1    0    0    -1  
$EndComp
NoConn ~ 11400 2600
NoConn ~ 11400 2000
NoConn ~ 11400 1900
$Comp
L Memory_RAM2:Micro_SD_Card_Kit J2
U 1 1 6188B7C4
P 12300 2100
F 0 "J2" H 11800 2800 50  0000 L CNN
F 1 "Micro_SD_Card_Kit" H 12300 2800 50  0000 L CNN
F 2 "MZ80k_SD:AE-microSD-LLCNV" H 13450 2400 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 12300 2100 50  0001 C CNN
	1    12300 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3900 9800 3900
Wire Wire Line
	9550 3800 9900 3800
Wire Wire Line
	9550 3700 11600 3700
Wire Wire Line
	9550 3600 11700 3600
Wire Wire Line
	11400 2500 11100 2500
Wire Wire Line
	11100 2500 11100 3500
Wire Wire Line
	11100 3500 12000 3500
Wire Wire Line
	12000 3500 12000 5200
Wire Wire Line
	12000 5200 11250 5200
Wire Wire Line
	11400 2400 11000 2400
Wire Wire Line
	11000 2400 11000 3400
Wire Wire Line
	11000 3400 12100 3400
Wire Wire Line
	12100 3400 12100 5100
Wire Wire Line
	12100 5100 11250 5100
Wire Wire Line
	11400 2300 10900 2300
Wire Wire Line
	10900 2300 10900 3300
Wire Wire Line
	10900 3300 12200 3300
Wire Wire Line
	12200 3300 12200 5000
Wire Wire Line
	12200 5000 11250 5000
Wire Wire Line
	11400 2200 10800 2200
Wire Wire Line
	10800 2200 10800 3200
Wire Wire Line
	10800 3200 12300 3200
Wire Wire Line
	12300 3200 12300 4900
Wire Wire Line
	12300 4900 11250 4900
Wire Wire Line
	1600 5300 1450 5300
Wire Wire Line
	1450 5300 1450 5200
Connection ~ 1450 4500
Wire Wire Line
	1450 4500 800  4500
Wire Wire Line
	1600 4600 1450 4600
Connection ~ 1450 4600
Wire Wire Line
	1450 4600 1450 4500
Wire Wire Line
	1600 4700 1450 4700
Connection ~ 1450 4700
Wire Wire Line
	1450 4700 1450 4600
Wire Wire Line
	1600 4800 1450 4800
Connection ~ 1450 4800
Wire Wire Line
	1450 4800 1450 4700
Wire Wire Line
	1600 4900 1450 4900
Connection ~ 1450 4900
Wire Wire Line
	1450 4900 1450 4800
Wire Wire Line
	1600 5000 1450 5000
Connection ~ 1450 5000
Wire Wire Line
	1450 5000 1450 4900
Wire Wire Line
	1600 5100 1450 5100
Connection ~ 1450 5100
Wire Wire Line
	1450 5100 1450 5000
Wire Wire Line
	1600 5200 1450 5200
Connection ~ 1450 5200
Wire Wire Line
	1450 5200 1450 5100
Wire Wire Line
	1450 4500 1450 4100
Wire Wire Line
	1450 4100 1600 4100
Wire Wire Line
	1450 4100 1450 3700
Wire Wire Line
	1450 3700 1600 3700
Connection ~ 1450 4100
Wire Wire Line
	1450 3700 1450 3500
Wire Wire Line
	1450 3500 1600 3500
Connection ~ 1450 3700
Wire Wire Line
	1450 3500 1450 3300
Wire Wire Line
	1450 3300 1600 3300
Connection ~ 1450 3500
Wire Wire Line
	1450 3300 1450 3100
Wire Wire Line
	1450 3100 1600 3100
Connection ~ 1450 3300
Wire Wire Line
	3000 4500 8150 4500
Wire Wire Line
	2200 5300 2200 1250
Wire Wire Line
	2200 1250 7650 1250
Wire Wire Line
	2300 5200 2300 1150
Wire Wire Line
	2300 1150 7600 1150
Wire Wire Line
	2400 5100 2400 1050
Wire Wire Line
	2400 1050 7550 1050
Wire Wire Line
	2500 5000 2500 950 
Wire Wire Line
	2500 950  7500 950 
Wire Wire Line
	2600 4900 2600 850 
Wire Wire Line
	2600 850  7450 850 
Wire Wire Line
	2700 4800 2700 750 
Wire Wire Line
	2700 750  7400 750 
Wire Wire Line
	2800 4700 2800 650 
Wire Wire Line
	2800 650  7350 650 
Wire Wire Line
	2900 4600 2900 550 
Wire Wire Line
	2900 550  7300 550 
Wire Wire Line
	7050 3900 8150 3900
Wire Wire Line
	7750 6800 7750 4000
Wire Wire Line
	7750 4000 8150 4000
Wire Wire Line
	7850 6900 7850 4100
Wire Wire Line
	7850 4100 8150 4100
Wire Wire Line
	1050 6900 7850 6900
Wire Wire Line
	7650 4800 8150 4800
Wire Wire Line
	7600 4900 8150 4900
Wire Wire Line
	7550 5000 8150 5000
Wire Wire Line
	7500 5100 8150 5100
Wire Wire Line
	7450 5200 8150 5200
Wire Wire Line
	7400 5300 8150 5300
Wire Wire Line
	7350 5400 8150 5400
Wire Wire Line
	7300 5500 8150 5500
Wire Wire Line
	2100 3700 3700 3700
Wire Wire Line
	2100 3800 3600 3800
Wire Wire Line
	2100 3900 3500 3900
Wire Wire Line
	2100 4000 3400 4000
Wire Wire Line
	2100 4100 3300 4100
$Comp
L 74xx:74LS04 U1
U 1 1 6212ABE9
P 3750 7400
F 0 "U1" H 3750 7717 50  0000 C CNN
F 1 "74LS04" H 3750 7626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3750 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3750 7400 50  0001 C CNN
	1    3750 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U6
U 2 1 621D8C3B
P 6850 8100
F 0 "U6" H 7080 8146 50  0000 L CNN
F 1 "74LS30" H 7080 8055 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6850 8100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 6850 8100 50  0001 C CNN
	2    6850 8100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U6
U 1 1 621DA5E3
P 6650 5950
F 0 "U6" H 6650 6475 50  0000 C CNN
F 1 "74LS30" H 6650 6384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6650 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 6650 5950 50  0001 C CNN
	1    6650 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 7 1 62200B27
P 5700 8100
F 0 "U1" H 5930 8146 50  0000 L CNN
F 1 "74LS04" H 5930 8055 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5700 8100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5700 8100 50  0001 C CNN
	7    5700 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4200 3200 4200
$Comp
L 74xx:74LS04 U1
U 2 1 6232A904
P 3750 7850
F 0 "U1" H 3350 8000 50  0000 C CNN
F 1 "74LS04" H 3950 8000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3750 7850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3750 7850 50  0001 C CNN
	2    3750 7850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 3 1 6232C3F4
P 8900 2900
F 0 "U1" H 8550 3050 50  0000 C CNN
F 1 "74LS04" H 9100 3050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8900 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8900 2900 50  0001 C CNN
	3    8900 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 4 1 6232D3FF
P 4050 5650
F 0 "U1" H 4800 5700 50  0000 C CNN
F 1 "74LS04" H 4500 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4050 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4050 5650 50  0001 C CNN
	4    4050 5650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 5 1 6232E33E
P 4850 6050
F 0 "U1" H 5150 6300 50  0000 C CNN
F 1 "74LS04" H 4850 6300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4850 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4850 6050 50  0001 C CNN
	5    4850 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 6 1 6232F73D
P 5600 6450
F 0 "U1" H 5800 6200 50  0000 C CNN
F 1 "74LS04" H 5450 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5600 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5600 6450 50  0001 C CNN
	6    5600 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5650 4350 5650
Wire Wire Line
	3200 4200 3200 5650
Wire Wire Line
	3200 5650 3750 5650
Wire Wire Line
	3300 4100 3300 5850
Wire Wire Line
	3300 5850 4350 5850
Wire Wire Line
	4350 5850 4350 5750
Wire Wire Line
	4350 5750 6350 5750
Wire Wire Line
	6350 5950 5150 5950
Wire Wire Line
	5150 5950 5150 6050
Wire Wire Line
	3400 4000 3400 5950
Wire Wire Line
	3400 5950 4450 5950
Wire Wire Line
	4450 5950 4450 5850
Wire Wire Line
	4450 5850 6350 5850
Wire Wire Line
	3500 3900 3500 6050
Wire Wire Line
	3500 6050 4550 6050
Wire Wire Line
	3600 3800 3600 6250
Wire Wire Line
	3600 6250 5250 6250
Wire Wire Line
	5250 6250 5250 6050
Wire Wire Line
	5250 6050 6350 6050
Wire Wire Line
	3700 3700 3700 6350
Wire Wire Line
	3700 6350 5350 6350
Wire Wire Line
	5350 6350 5350 6150
Wire Wire Line
	5350 6150 6350 6150
Wire Wire Line
	5150 6700 5150 6450
Wire Wire Line
	5150 6450 5300 6450
Wire Wire Line
	5900 6450 6150 6450
Wire Wire Line
	6150 6450 6150 6250
Wire Wire Line
	6150 6250 6350 6250
Wire Wire Line
	6950 5950 7050 5950
Wire Wire Line
	7050 3900 7050 5950
$Comp
L power:+5V #PWR017
U 1 1 6252FE80
P 6700 6450
F 0 "#PWR017" H 6700 6300 50  0001 C CNN
F 1 "+5V" H 6715 6623 50  0000 C CNN
F 2 "" H 6700 6450 50  0001 C CNN
F 3 "" H 6700 6450 50  0001 C CNN
	1    6700 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 6350 6300 6350
Wire Wire Line
	6300 6350 6300 6550
Wire Wire Line
	6300 6550 6700 6550
Wire Wire Line
	6700 6550 6700 6450
Wire Wire Line
	3450 7850 3300 7850
$Comp
L power:GND #PWR02
U 1 1 62817458
P 3300 8450
F 0 "#PWR02" H 3300 8200 50  0001 C CNN
F 1 "GND" H 3305 8277 50  0000 C CNN
F 2 "" H 3300 8450 50  0001 C CNN
F 3 "" H 3300 8450 50  0001 C CNN
	1    3300 8450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 628C00D7
P 5250 8150
F 0 "C1" V 5100 8250 50  0000 C CNN
F 1 "0.1uF" V 5100 8000 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5288 8000 50  0001 C CNN
F 3 "~" H 5250 8150 50  0001 C CNN
	1    5250 8150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C5
U 1 1 62902A84
P 6450 8150
F 0 "C5" V 6300 8250 50  0000 C CNN
F 1 "0.1uF" V 6300 8000 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6488 8000 50  0001 C CNN
F 3 "~" H 6450 8150 50  0001 C CNN
	1    6450 8150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 8000 5250 7500
Wire Wire Line
	5250 7500 5700 7500
Wire Wire Line
	5700 7500 5700 7600
Connection ~ 5700 7500
Wire Wire Line
	6850 7500 6850 7600
Wire Wire Line
	5250 8300 5250 8700
Wire Wire Line
	5250 8700 5700 8700
Wire Wire Line
	5700 8700 5700 8600
Connection ~ 5700 8700
Wire Wire Line
	6850 8700 6850 8600
Wire Wire Line
	6450 8300 6450 8700
Connection ~ 6450 8700
Wire Wire Line
	6450 8700 6850 8700
Wire Wire Line
	6450 8000 6450 7500
Connection ~ 6450 7500
Wire Wire Line
	6450 7500 6850 7500
$Comp
L power:GND #PWR016
U 1 1 62BBAEEE
P 5250 8800
F 0 "#PWR016" H 5250 8550 50  0001 C CNN
F 1 "GND" H 5255 8627 50  0000 C CNN
F 2 "" H 5250 8800 50  0001 C CNN
F 3 "" H 5250 8800 50  0001 C CNN
	1    5250 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 62C0DD1E
P 5250 7400
F 0 "#PWR014" H 5250 7250 50  0001 C CNN
F 1 "+5V" H 5265 7573 50  0000 C CNN
F 2 "" H 5250 7400 50  0001 C CNN
F 3 "" H 5250 7400 50  0001 C CNN
	1    5250 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 7400 5250 7500
Connection ~ 5250 7500
Wire Wire Line
	5250 8700 5250 8800
Connection ~ 5250 8700
NoConn ~ 4050 7850
Wire Wire Line
	9550 5200 10050 5200
Wire Wire Line
	9550 5100 10050 5100
Wire Wire Line
	9550 5000 10050 5000
Wire Wire Line
	9550 4900 10050 4900
Wire Wire Line
	9550 4800 10050 4800
Wire Wire Line
	9550 4700 10050 4700
Wire Wire Line
	9550 4600 10050 4600
Wire Wire Line
	9550 4500 10050 4500
Wire Wire Line
	9550 6100 11600 6100
Wire Wire Line
	7950 3600 7950 2900
Wire Wire Line
	9950 2900 9950 4300
Wire Wire Line
	9950 4300 10050 4300
Connection ~ 7950 3600
Wire Wire Line
	3300 7850 3300 8450
Wire Wire Line
	7950 2900 8600 2900
Wire Wire Line
	9200 2900 9950 2900
Text Label 2100 5300 0    50   ~ 0
D0
Text Label 2100 5200 0    50   ~ 0
D1
Text Label 2100 5100 0    50   ~ 0
D2
Text Label 2100 5000 0    50   ~ 0
D3
Text Label 2100 4900 0    50   ~ 0
D4
Text Label 2100 4800 0    50   ~ 0
D5
Text Label 2100 4700 0    50   ~ 0
D6
Text Label 2100 4600 0    50   ~ 0
D7
Text Label 2100 4400 0    50   ~ 0
A0
Text Label 2100 4300 0    50   ~ 0
A1
Text Label 2100 4200 0    50   ~ 0
A2
Text Label 2100 4100 0    50   ~ 0
A3
Text Label 2100 4000 0    50   ~ 0
A4
Text Label 2100 3900 0    50   ~ 0
A5
Text Label 2100 3800 0    50   ~ 0
A6
Text Label 2100 3700 0    50   ~ 0
A7
Text Label 2100 3600 0    50   ~ 0
A8
Text Label 2100 3500 0    50   ~ 0
A9
Text Label 2100 3400 0    50   ~ 0
A10
Text Label 2100 3300 0    50   ~ 0
A11
Text Label 2100 3200 0    50   ~ 0
A12
Text Label 2100 3100 0    50   ~ 0
A13
Text Label 2100 3000 0    50   ~ 0
A14
Text Label 2100 2900 0    50   ~ 0
A15
Text Label 1450 3100 0    50   ~ 0
GND
Text Label 1400 3200 0    50   ~ 0
~MREQ
Text Label 1450 3300 0    50   ~ 0
GND
Text Label 1450 3500 0    50   ~ 0
GND
Text Label 1450 3700 0    50   ~ 0
GND
Text Label 1450 4100 0    50   ~ 0
GND
Text Label 1450 4500 0    50   ~ 0
GND
Text Label 1450 4600 0    50   ~ 0
GND
Text Label 1450 4700 0    50   ~ 0
GND
Text Label 1450 4800 0    50   ~ 0
GND
Text Label 1450 4900 0    50   ~ 0
GND
Text Label 1450 5000 0    50   ~ 0
GND
Text Label 1450 5100 0    50   ~ 0
GND
Text Label 1450 5200 0    50   ~ 0
GND
Text Label 1450 5300 0    50   ~ 0
GND
Text Label 1400 3400 0    50   ~ 0
~IORQ
Text Label 1500 3600 0    50   ~ 0
~RD
Text Label 1500 3800 0    50   ~ 0
~WR
Text Label 1400 4400 0    50   ~ 0
RESET
$Comp
L Connector_Generic:Conn_01x06 J5
U 1 1 62D11F48
P 13050 3250
F 0 "J5" H 13130 3242 50  0000 L CNN
F 1 "MicroSD Card Adapter" H 12450 2800 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 13050 3250 50  0001 C CNN
F 3 "~" H 13050 3250 50  0001 C CNN
	1    13050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 3050 12600 3050
Wire Wire Line
	12850 3150 12600 3150
Wire Wire Line
	12850 3250 12600 3250
Wire Wire Line
	12850 3350 12600 3350
Wire Wire Line
	12850 3450 12600 3450
Wire Wire Line
	12850 3550 12600 3550
Text Label 11000 2200 0    50   ~ 0
SCK
Text Label 11000 2300 0    50   ~ 0
MISO
Text Label 11000 2400 0    50   ~ 0
MOSI
Text Label 11100 2500 0    50   ~ 0
CS
Text Label 12600 3050 0    50   ~ 0
GND
Text Label 12600 3150 0    50   ~ 0
+5V
Text Label 12600 3250 0    50   ~ 0
MISO
Text Label 12600 3350 0    50   ~ 0
MOSI
Text Label 12600 3450 0    50   ~ 0
SCK
Text Label 12600 3550 0    50   ~ 0
CS
Wire Wire Line
	1150 6800 7750 6800
Wire Wire Line
	7650 1250 7650 4800
Wire Wire Line
	7600 1150 7600 4900
Wire Wire Line
	7550 1050 7550 5000
Wire Wire Line
	7500 950  7500 5100
Wire Wire Line
	7450 850  7450 5200
Wire Wire Line
	7400 750  7400 5300
Wire Wire Line
	7350 650  7350 5400
Wire Wire Line
	7300 550  7300 5500
Wire Wire Line
	2100 4400 8150 4400
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 69B781BD
P 10650 7500
AR Path="/69B5C9B8/69B781BD" Ref="J?"  Part="1" 
AR Path="/69B781BD" Ref="J6"  Part="1" 
F 0 "J6" H 10700 8417 50  0000 C CNN
F 1 "RP2350B Left" H 10700 8326 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 10650 7500 50  0001 C CNN
F 3 "~" H 10650 7500 50  0001 C CNN
	1    10650 7500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 69B781C3
P 12750 7500
AR Path="/69B5C9B8/69B781C3" Ref="J?"  Part="1" 
AR Path="/69B781C3" Ref="J7"  Part="1" 
F 0 "J7" H 12800 8417 50  0000 C CNN
F 1 "RP2350B Right" H 12800 8326 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 12750 7500 50  0001 C CNN
F 3 "~" H 12750 7500 50  0001 C CNN
	1    12750 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 69B781C9
P 14650 7100
AR Path="/69B5C9B8/69B781C9" Ref="R?"  Part="1" 
AR Path="/69B781C9" Ref="R1"  Part="1" 
F 0 "R1" V 14443 7100 50  0000 C CNN
F 1 "330" V 14534 7100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 14580 7100 50  0001 C CNN
F 3 "~" H 14650 7100 50  0001 C CNN
	1    14650 7100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 69B781CF
P 14650 7500
AR Path="/69B5C9B8/69B781CF" Ref="R?"  Part="1" 
AR Path="/69B781CF" Ref="R2"  Part="1" 
F 0 "R2" V 14443 7500 50  0000 C CNN
F 1 "330" V 14534 7500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 14580 7500 50  0001 C CNN
F 3 "~" H 14650 7500 50  0001 C CNN
	1    14650 7500
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 69B781D5
P 14650 7900
AR Path="/69B5C9B8/69B781D5" Ref="R?"  Part="1" 
AR Path="/69B781D5" Ref="R3"  Part="1" 
F 0 "R3" V 14443 7900 50  0000 C CNN
F 1 "330" V 14534 7900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 14580 7900 50  0001 C CNN
F 3 "~" H 14650 7900 50  0001 C CNN
	1    14650 7900
	0    1    1    0   
$EndComp
$Comp
L Connector:DB15_Female_HighDensity J?
U 1 1 69B781DB
P 15750 7500
AR Path="/69B5C9B8/69B781DB" Ref="J?"  Part="1" 
AR Path="/69B781DB" Ref="J8"  Part="1" 
F 0 "J8" H 15750 8367 50  0000 C CNN
F 1 "VGA" H 15750 8276 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-15-HD_Female_Horizontal_P2.29x1.98mm_EdgePinOffset3.03mm_Housed_MountingHolesOffset4.94mm" H 14800 7900 50  0001 C CNN
F 3 " ~" H 14800 7900 50  0001 C CNN
	1    15750 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 6800 10050 6800
Text Label 10050 6800 0    50   ~ 0
+5V
Text Label 10050 7200 0    50   ~ 0
D3
Text Label 10050 7300 0    50   ~ 0
D5
Text Label 10050 7400 0    50   ~ 0
D7
Wire Wire Line
	10050 7200 10450 7200
Wire Wire Line
	10050 7300 10450 7300
Wire Wire Line
	10050 7400 10450 7400
Wire Wire Line
	11350 7200 10950 7200
Wire Wire Line
	11350 7300 10950 7300
Text Label 11350 7200 2    50   ~ 0
D4
Text Label 11350 7300 2    50   ~ 0
D6
Text Label 10050 7100 0    50   ~ 0
D1
Text Label 11350 7000 2    50   ~ 0
D0
Text Label 11350 7100 2    50   ~ 0
D2
Wire Wire Line
	10950 7100 11350 7100
Wire Wire Line
	10950 7000 11350 7000
Wire Wire Line
	10050 7100 10450 7100
Text Label 10050 7900 0    50   ~ 0
A9
Text Label 10050 8000 0    50   ~ 0
A11
Text Label 10050 7800 0    50   ~ 0
A7
Text Label 11350 8000 2    50   ~ 0
A12
Text Label 11350 8100 2    50   ~ 0
A14
Text Label 10050 7500 0    50   ~ 0
A1
Text Label 10050 7600 0    50   ~ 0
A3
Text Label 10050 7700 0    50   ~ 0
A5
Text Label 11350 7900 2    50   ~ 0
A10
Text Label 11350 7700 2    50   ~ 0
A6
Text Label 11350 7800 2    50   ~ 0
A8
Text Label 10050 8100 0    50   ~ 0
A13
Text Label 11350 7400 2    50   ~ 0
A0
Text Label 11350 7500 2    50   ~ 0
A2
Text Label 11350 7600 2    50   ~ 0
A4
Text Label 10050 8200 0    50   ~ 0
A15
Wire Wire Line
	10950 7400 11350 7400
Wire Wire Line
	10950 7500 11350 7500
Wire Wire Line
	10950 7600 11350 7600
Wire Wire Line
	10950 7700 11350 7700
Wire Wire Line
	10950 7800 11350 7800
Wire Wire Line
	10950 7900 11350 7900
Wire Wire Line
	10950 8000 11350 8000
Wire Wire Line
	10950 8100 11350 8100
Wire Wire Line
	10050 7500 10450 7500
Wire Wire Line
	10050 7600 10450 7600
Wire Wire Line
	10050 7700 10450 7700
Wire Wire Line
	10050 7800 10450 7800
Wire Wire Line
	10050 7900 10450 7900
Wire Wire Line
	10050 8000 10450 8000
Wire Wire Line
	10050 8100 10450 8100
Wire Wire Line
	10050 8200 10450 8200
NoConn ~ 10450 7000
NoConn ~ 10950 6800
NoConn ~ 12550 7000
NoConn ~ 12550 7300
NoConn ~ 12550 7400
NoConn ~ 12550 7500
NoConn ~ 12550 8100
NoConn ~ 13050 7000
NoConn ~ 13050 7100
NoConn ~ 13050 7300
NoConn ~ 13050 7400
NoConn ~ 13050 7600
Wire Wire Line
	12150 7900 12550 7900
Text Label 12150 7900 0    50   ~ 0
~RD
Text Label 12150 8000 0    50   ~ 0
~IORQ
Wire Wire Line
	12150 8000 12550 8000
Text Label 12150 8200 0    50   ~ 0
RESET
Wire Wire Line
	12150 8200 12550 8200
Text Label 13450 7900 2    50   ~ 0
~EXWAIT
Wire Wire Line
	13450 7900 13050 7900
Text Label 13450 8000 2    50   ~ 0
~WR
Wire Wire Line
	13450 8000 13050 8000
Text Label 13450 8100 2    50   ~ 0
~MREQ
Wire Wire Line
	13450 8100 13050 8100
Wire Wire Line
	13050 7700 13900 7700
Wire Wire Line
	13900 7700 13900 7100
Wire Wire Line
	13900 7100 14500 7100
Wire Wire Line
	14800 7100 15450 7100
Wire Wire Line
	14800 7500 15450 7500
Wire Wire Line
	14500 7500 14000 7500
Wire Wire Line
	14000 7500 14000 8750
Wire Wire Line
	14000 8750 11700 8750
Wire Wire Line
	11700 8750 11700 7700
Wire Wire Line
	11700 7700 12550 7700
Wire Wire Line
	14800 7900 14900 7900
Wire Wire Line
	14900 7900 14900 7300
Wire Wire Line
	14900 7300 15450 7300
Wire Wire Line
	14500 7900 14100 7900
Wire Wire Line
	14100 7900 14100 8850
Wire Wire Line
	14100 8850 11600 8850
Wire Wire Line
	11600 8850 11600 7600
Wire Wire Line
	11600 7600 12550 7600
Wire Wire Line
	12550 7800 11800 7800
Wire Wire Line
	11800 7800 11800 8950
Wire Wire Line
	11800 8950 16350 8950
Wire Wire Line
	16350 8950 16350 7500
Wire Wire Line
	16350 7500 16050 7500
Wire Wire Line
	13050 7800 13900 7800
Wire Wire Line
	13900 7800 13900 8650
Wire Wire Line
	13900 8650 16250 8650
Wire Wire Line
	16250 8650 16250 7700
Wire Wire Line
	16250 7700 16050 7700
Wire Wire Line
	15450 7000 15250 7000
Wire Wire Line
	15250 7000 15250 7200
Wire Wire Line
	15250 7200 15450 7200
Wire Wire Line
	15250 7200 15250 7400
Wire Wire Line
	15250 7400 15450 7400
Connection ~ 15250 7200
Wire Wire Line
	15250 7400 15250 7800
Wire Wire Line
	15250 7800 15450 7800
Connection ~ 15250 7400
NoConn ~ 16050 7100
NoConn ~ 16050 7300
NoConn ~ 16050 7900
NoConn ~ 15450 7600
NoConn ~ 15450 7700
NoConn ~ 15450 7900
Wire Wire Line
	13050 6800 13450 6800
Wire Wire Line
	13450 6800 13450 6900
$Comp
L power:GND #PWR?
U 1 1 69B78263
P 13450 7150
AR Path="/69B5C9B8/69B78263" Ref="#PWR?"  Part="1" 
AR Path="/69B78263" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 13450 6900 50  0001 C CNN
F 1 "GND" H 13455 6977 50  0000 C CNN
F 2 "" H 13450 7150 50  0001 C CNN
F 3 "" H 13450 7150 50  0001 C CNN
	1    13450 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 69B78269
P 15250 7950
AR Path="/69B5C9B8/69B78269" Ref="#PWR?"  Part="1" 
AR Path="/69B78269" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 15250 7700 50  0001 C CNN
F 1 "GND" H 15255 7777 50  0000 C CNN
F 2 "" H 15250 7950 50  0001 C CNN
F 3 "" H 15250 7950 50  0001 C CNN
	1    15250 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	15250 7950 15250 7800
Connection ~ 15250 7800
Text Label 1600 3900 2    50   ~ 0
~EXWAIT
Wire Wire Line
	1600 3900 1200 3900
NoConn ~ 4050 7400
Wire Wire Line
	3450 7400 3300 7400
Wire Wire Line
	3300 7400 3300 7850
Connection ~ 3300 7850
Wire Wire Line
	5700 7500 6450 7500
Wire Wire Line
	5700 8700 6450 8700
$Comp
L Connector:Conn_Coaxial J9
U 1 1 69C380E6
P 14950 5850
F 0 "J9" H 15050 5825 50  0000 L CNN
F 1 "Conn_Coaxial" H 15050 5734 50  0000 L CNN
F 2 "RCA:RCAConAE" H 14950 5850 50  0001 C CNN
F 3 " ~" H 14950 5850 50  0001 C CNN
	1    14950 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14950 6050 14950 6450
$Comp
L power:GND #PWR?
U 1 1 69C3B370
P 14950 6500
AR Path="/69B5C9B8/69C3B370" Ref="#PWR?"  Part="1" 
AR Path="/69C3B370" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 14950 6250 50  0001 C CNN
F 1 "GND" H 14955 6327 50  0000 C CNN
F 2 "" H 14950 6500 50  0001 C CNN
F 3 "" H 14950 6500 50  0001 C CNN
	1    14950 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 69C74136
P 14450 5850
AR Path="/69B5C9B8/69C74136" Ref="R?"  Part="1" 
AR Path="/69C74136" Ref="R4"  Part="1" 
F 0 "R4" V 14243 5850 50  0000 C CNN
F 1 "1k" V 14334 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 14380 5850 50  0001 C CNN
F 3 "~" H 14450 5850 50  0001 C CNN
	1    14450 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	14600 5850 14750 5850
Wire Wire Line
	12550 7100 12250 7100
$Comp
L Device:C C2
U 1 1 69CE90A8
P 14600 6200
F 0 "C2" V 14450 6300 50  0000 C CNN
F 1 "0.01uF" V 14450 6050 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 14638 6050 50  0001 C CNN
F 3 "~" H 14600 6200 50  0001 C CNN
	1    14600 6200
	-1   0    0    1   
$EndComp
Wire Wire Line
	14600 6050 14600 5850
Wire Wire Line
	14600 6350 14600 6450
Connection ~ 14950 6450
Wire Wire Line
	14950 6450 14950 6500
Text Label 1600 3000 2    50   ~ 0
~EXINIT
Wire Wire Line
	1600 3000 1200 3000
Text Label 11350 8200 2    50   ~ 0
~EXINIT
Wire Wire Line
	11350 8200 10950 8200
Text Label 13450 8200 2    50   ~ 0
M1
Wire Wire Line
	13450 8200 13050 8200
Wire Wire Line
	12250 5850 12250 7100
NoConn ~ 12550 6900
Wire Wire Line
	13050 6900 13450 6900
Connection ~ 13450 6900
Wire Wire Line
	13450 6900 13450 7150
Wire Wire Line
	12550 6800 12400 6800
Wire Wire Line
	12400 6800 12400 6400
Wire Wire Line
	12400 6400 13450 6400
Wire Wire Line
	13450 6400 13450 6800
Connection ~ 13450 6800
Wire Wire Line
	10950 6900 11400 6900
Wire Wire Line
	11400 6900 11400 6400
Wire Wire Line
	11400 6400 12400 6400
Connection ~ 12400 6400
Wire Wire Line
	11400 6400 10300 6400
Wire Wire Line
	10300 6400 10300 6900
Wire Wire Line
	10300 6900 10450 6900
Connection ~ 11400 6400
Text Label 1600 4000 2    50   ~ 0
M1
Wire Wire Line
	1600 4000 1200 4000
$Comp
L Switch:SW_Push SW1
U 1 1 69F7BCE9
P 14950 4250
F 0 "SW1" H 14950 4535 50  0000 C CNN
F 1 "SW_Push" H 14950 4444 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 14950 4450 50  0001 C CNN
F 3 "~" H 14950 4450 50  0001 C CNN
	1    14950 4250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 69F7D341
P 14950 4700
F 0 "SW2" H 14950 4985 50  0000 C CNN
F 1 "SW_Push" H 14950 4894 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 14950 4900 50  0001 C CNN
F 3 "~" H 14950 4900 50  0001 C CNN
	1    14950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 69F81191
P 15400 4950
AR Path="/69B5C9B8/69F81191" Ref="#PWR?"  Part="1" 
AR Path="/69F81191" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 15400 4700 50  0001 C CNN
F 1 "GND" H 15405 4777 50  0000 C CNN
F 2 "" H 15400 4950 50  0001 C CNN
F 3 "" H 15400 4950 50  0001 C CNN
	1    15400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 4250 15400 4250
Wire Wire Line
	15400 4250 15400 4700
Wire Wire Line
	15150 4700 15400 4700
Connection ~ 15400 4700
Wire Wire Line
	15400 4700 15400 4950
Wire Wire Line
	12550 7200 12150 7200
Wire Wire Line
	12150 7200 12150 5750
Wire Wire Line
	12150 5750 13000 5750
Wire Wire Line
	13000 5750 13000 4250
Wire Wire Line
	13000 4250 14750 4250
Wire Wire Line
	13050 7200 13200 7200
Wire Wire Line
	13200 7200 13200 4700
Wire Wire Line
	13200 4700 14750 4700
NoConn ~ 13050 7500
Wire Wire Line
	14600 6450 14950 6450
Wire Wire Line
	12250 5850 14300 5850
Connection ~ 14600 5850
$EndSCHEMATC
