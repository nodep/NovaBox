EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "NovaBox"
Date "2018-08-20"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1250 3050 0    60   Input ~ 0
SPI_PCM
$Comp
L NovaBox:R R6
U 1 1 57F3BA6C
P 1600 3300
F 0 "R6" V 1500 3300 50  0000 C CNN
F 1 "10K" V 1600 3300 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1530 3300 50  0001 C CNN
F 3 "" H 1600 3300 50  0000 C CNN
	1    1600 3300
	0    1    1    0   
$EndComp
Text GLabel 1250 3300 0    60   Input ~ 0
CSR_RST
Text GLabel 1950 3300 2    60   Input ~ 0
1V8
$Comp
L NovaBox:C C1
U 1 1 57F3BA6D
P 1350 3500
F 0 "C1" H 1375 3600 50  0000 L CNN
F 1 "100nF" H 1375 3400 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1388 3350 50  0001 C CNN
F 3 "" H 1350 3500 50  0000 C CNN
	1    1350 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 57F3BA6E
P 1350 3700
F 0 "#PWR01" H 1350 3450 50  0001 C CNN
F 1 "GND" H 1350 3550 50  0000 C CNN
F 2 "" H 1350 3700 50  0000 C CNN
F 3 "" H 1350 3700 50  0000 C CNN
	1    1350 3700
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R R9
U 1 1 57F3BA72
P 1750 2150
F 0 "R9" V 1650 2150 50  0000 C CNN
F 1 "1K" V 1750 2150 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1680 2150 50  0001 C CNN
F 3 "" H 1750 2150 50  0000 C CNN
	1    1750 2150
	0    1    1    0   
$EndComp
Text GLabel 1100 2400 0    60   Input ~ 0
PIO20
Text GLabel 1100 2650 0    60   Input ~ 0
PIO19
$Comp
L power:+BATT #PWR02
U 1 1 57F3BA79
P 5400 5250
F 0 "#PWR02" H 5400 5100 50  0001 C CNN
F 1 "+BATT" H 5400 5390 50  0000 C CNN
F 2 "" H 5400 5250 50  0000 C CNN
F 3 "" H 5400 5250 50  0000 C CNN
	1    5400 5250
	-1   0    0    -1  
$EndComp
Text GLabel 1950 1900 1    60   Input ~ 0
1V8
Text GLabel 1100 1900 0    60   Input ~ 0
PIO21
Text GLabel 1100 1650 0    60   Input ~ 0
PIO18
Text GLabel 1100 2150 0    60   Input ~ 0
PIO8
$Comp
L NovaBox:Battery BT1
U 1 1 57F3E8ED
P 5400 5700
F 0 "BT1" H 5500 5750 50  0000 L CNN
F 1 "18650" H 5500 5650 50  0000 L CNN
F 2 "NovaBox:Batt_Holder_18650" V 5400 5740 50  0001 C CNN
F 3 "" V 5400 5740 50  0000 C CNN
	1    5400 5700
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:HOLE P1
U 1 1 580E792B
P 6300 7300
F 0 "P1" H 6300 7400 50  0000 C CNN
F 1 "MH" V 6400 7300 50  0000 C CNN
F 2 "NovaBox:MountingHole" H 6300 7300 50  0001 C CNN
F 3 "" H 6300 7300 50  0000 C CNN
	1    6300 7300
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:HOLE P3
U 1 1 580E8887
P 6700 7300
F 0 "P3" H 6700 7400 50  0000 C CNN
F 1 "MH" V 6800 7300 50  0000 C CNN
F 2 "NovaBox:MountingHole" H 6700 7300 50  0001 C CNN
F 3 "" H 6700 7300 50  0000 C CNN
	1    6700 7300
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:HOLE P2
U 1 1 580E8963
P 6300 7600
F 0 "P2" H 6300 7700 50  0000 C CNN
F 1 "MH" V 6400 7600 50  0000 C CNN
F 2 "NovaBox:MountingHole" H 6300 7600 50  0001 C CNN
F 3 "" H 6300 7600 50  0000 C CNN
	1    6300 7600
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:HOLE P4
U 1 1 580E8A4C
P 6700 7600
F 0 "P4" H 6700 7700 50  0000 C CNN
F 1 "MH" V 6800 7600 50  0000 C CNN
F 2 "NovaBox:MountingHole" H 6700 7600 50  0001 C CNN
F 3 "" H 6700 7600 50  0000 C CNN
	1    6700 7600
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:R R4
U 1 1 581A041F
P 8100 5200
F 0 "R4" V 8000 5200 50  0000 C CNN
F 1 "10K" V 8100 5200 50  0000 C CNN
F 2 "NovaBox:R_0805" V 8030 5200 50  0001 C CNN
F 3 "" H 8100 5200 50  0000 C CNN
	1    8100 5200
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:C C2
U 1 1 581A0D6D
P 8450 5100
F 0 "C2" H 8475 5200 50  0000 L CNN
F 1 "1uF" H 8475 5000 50  0000 L CNN
F 2 "NovaBox:C_0805" H 8488 4950 50  0001 C CNN
F 3 "" H 8450 5100 50  0000 C CNN
	1    8450 5100
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:R R7
U 1 1 581A0EA5
P 8450 5500
F 0 "R7" V 8350 5500 50  0000 C CNN
F 1 "1K" V 8450 5500 50  0000 C CNN
F 2 "NovaBox:R_0805" V 8380 5500 50  0001 C CNN
F 3 "" H 8450 5500 50  0000 C CNN
	1    8450 5500
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:R R8
U 1 1 581A1A61
P 8450 6000
F 0 "R8" V 8350 6000 50  0000 C CNN
F 1 "10K" V 8450 6000 50  0000 C CNN
F 2 "NovaBox:R_0805" V 8380 6000 50  0001 C CNN
F 3 "" H 8450 6000 50  0000 C CNN
	1    8450 6000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 581A1EA8
P 8100 6300
F 0 "#PWR012" H 8100 6050 50  0001 C CNN
F 1 "GND" H 8100 6150 50  0000 C CNN
F 2 "" H 8100 6300 50  0000 C CNN
F 3 "" H 8100 6300 50  0000 C CNN
	1    8100 6300
	-1   0    0    -1  
$EndComp
Text GLabel 7950 5450 0    60   Input ~ 0
PWER_E
$Comp
L power:+BATT #PWR013
U 1 1 581A4150
P 8100 4850
F 0 "#PWR013" H 8100 4700 50  0001 C CNN
F 1 "+BATT" H 8100 4990 50  0000 C CNN
F 2 "" H 8100 4850 50  0000 C CNN
F 3 "" H 8100 4850 50  0000 C CNN
	1    8100 4850
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:MMBT3904 Q1
U 1 1 5819EAAF
P 8200 5750
F 0 "Q1" H 8400 5825 50  0000 L CNN
F 1 "MMBT3904" H 8400 5750 50  0000 L CNN
F 2 "NovaBox:SOT-23" H 8400 5675 50  0001 L CIN
F 3 "" H 8200 5750 50  0000 L CNN
	1    8200 5750
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:NMOS Q2
U 1 1 58207C6D
P 6100 6300
F 0 "Q2" V 6000 6200 50  0000 R CNN
F 1 "IRLML6344" V 6350 6500 50  0000 R CNN
F 2 "NovaBox:SOT-23" H 6300 6400 50  0001 C CNN
F 3 "" H 6100 6300 50  0000 C CNN
	1    6100 6300
	0    -1   1    0   
$EndComp
$Comp
L NovaBox:MCP6004 U1
U 1 1 58359F3A
P 2500 4650
F 0 "U1" H 2500 4850 50  0000 L CNN
F 1 "MCP6004" H 2500 4450 50  0000 L CNN
F 2 "NovaBox:TSSOP-14_4.4x5mm_Pitch0.65mm" H 2450 4750 50  0001 C CNN
F 3 "" H 2550 4850 50  0000 C CNN
	1    2500 4650
	1    0    0    1   
$EndComp
$Comp
L NovaBox:MCP6004 U1
U 2 1 58359F3B
P 2500 5500
F 0 "U1" H 2500 5700 50  0000 L CNN
F 1 "MCP6004" H 2500 5300 50  0000 L CNN
F 2 "NovaBox:TSSOP-14_4.4x5mm_Pitch0.65mm" H 2450 5600 50  0001 C CNN
F 3 "" H 2550 5700 50  0000 C CNN
	2    2500 5500
	1    0    0    1   
$EndComp
$Comp
L NovaBox:MCP6004 U1
U 4 1 58359F3C
P 2500 7200
F 0 "U1" H 2500 7400 50  0000 L CNN
F 1 "MCP6004" H 2500 7000 50  0000 L CNN
F 2 "NovaBox:TSSOP-14_4.4x5mm_Pitch0.65mm" H 2450 7300 50  0001 C CNN
F 3 "" H 2550 7400 50  0000 C CNN
	4    2500 7200
	1    0    0    1   
$EndComp
$Comp
L NovaBox:MCP6004 U1
U 3 1 58359F3D
P 2500 6350
F 0 "U1" H 2500 6550 50  0000 L CNN
F 1 "MCP6004" H 2500 6150 50  0000 L CNN
F 2 "NovaBox:TSSOP-14_4.4x5mm_Pitch0.65mm" H 2450 6450 50  0001 C CNN
F 3 "" H 2550 6550 50  0000 C CNN
	3    2500 6350
	1    0    0    1   
$EndComp
$Comp
L NovaBox:R R12
U 1 1 58359F40
P 1500 4750
F 0 "R12" V 1400 4750 50  0000 C CNN
F 1 "620K" V 1500 4750 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1430 4750 50  0001 C CNN
F 3 "" H 1500 4750 50  0000 C CNN
	1    1500 4750
	0    1    1    0   
$EndComp
$Comp
L NovaBox:R R11
U 1 1 58359F41
P 1650 4550
F 0 "R11" V 1550 4550 50  0000 C CNN
F 1 "240K" V 1650 4550 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1580 4550 50  0001 C CNN
F 3 "" H 1650 4550 50  0000 C CNN
	1    1650 4550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR031
U 1 1 58359F42
P 1100 5000
F 0 "#PWR031" H 1100 4750 50  0001 C CNN
F 1 "GND" H 1100 4850 50  0000 C CNN
F 2 "" H 1100 5000 50  0000 C CNN
F 3 "" H 1100 5000 50  0000 C CNN
	1    1100 5000
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR032
U 1 1 58359F43
P 1400 4500
F 0 "#PWR032" H 1400 4350 50  0001 C CNN
F 1 "+BATT" H 1400 4640 50  0000 C CNN
F 2 "" H 1400 4500 50  0000 C CNN
F 3 "" H 1400 4500 50  0000 C CNN
	1    1400 4500
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:LED D4
U 1 1 58359F44
P 4200 4650
F 0 "D4" H 4200 4750 50  0000 C CNN
F 1 "BATT_E" H 4200 4550 50  0000 C CNN
F 2 "NovaBox:LED_0805" H 4200 4650 50  0001 C CNN
F 3 "" H 4200 4650 50  0000 C CNN
	1    4200 4650
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:LED D5
U 1 1 58359F45
P 4200 5000
F 0 "D5" H 4200 5100 50  0000 C CNN
F 1 "BATT_L" H 4200 4900 50  0000 C CNN
F 2 "NovaBox:LED_0805" H 4200 5000 50  0001 C CNN
F 3 "" H 4200 5000 50  0000 C CNN
	1    4200 5000
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:LED D6
U 1 1 58359F46
P 4200 5350
F 0 "D6" H 4200 5450 50  0000 C CNN
F 1 "BATT_M" H 4200 5250 50  0000 C CNN
F 2 "NovaBox:LED_0805" H 4200 5350 50  0001 C CNN
F 3 "" H 4200 5350 50  0000 C CNN
	1    4200 5350
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:LED D7
U 1 1 58359F47
P 4200 5700
F 0 "D7" H 4200 5800 50  0000 C CNN
F 1 "BATT_H" H 4200 5600 50  0000 C CNN
F 2 "NovaBox:LED_0805" H 4200 5700 50  0001 C CNN
F 3 "" H 4200 5700 50  0000 C CNN
	1    4200 5700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR033
U 1 1 58359F48
P 4500 5750
F 0 "#PWR033" H 4500 5500 50  0001 C CNN
F 1 "GND" H 4500 5600 50  0000 C CNN
F 2 "" H 4500 5750 50  0000 C CNN
F 3 "" H 4500 5750 50  0000 C CNN
	1    4500 5750
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR035
U 1 1 58359F4D
P 1400 6150
F 0 "#PWR035" H 1400 6000 50  0001 C CNN
F 1 "+BATT" H 1400 6290 50  0000 C CNN
F 2 "" H 1400 6150 50  0000 C CNN
F 3 "" H 1400 6150 50  0000 C CNN
	1    1400 6150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 58359F4E
P 1100 6650
F 0 "#PWR036" H 1100 6400 50  0001 C CNN
F 1 "GND" H 1100 6500 50  0000 C CNN
F 2 "" H 1100 6650 50  0000 C CNN
F 3 "" H 1100 6650 50  0000 C CNN
	1    1100 6650
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R R15
U 1 1 58359F4F
P 1600 6250
F 0 "R15" V 1500 6250 50  0000 C CNN
F 1 "240K" V 1600 6250 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1530 6250 50  0001 C CNN
F 3 "" H 1600 6250 50  0000 C CNN
	1    1600 6250
	0    1    1    0   
$EndComp
$Comp
L NovaBox:R R16
U 1 1 58359F50
P 1500 6450
F 0 "R16" V 1400 6450 50  0000 C CNN
F 1 "470K" V 1500 6450 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1430 6450 50  0001 C CNN
F 3 "" H 1500 6450 50  0000 C CNN
	1    1500 6450
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR037
U 1 1 58359F51
P 1400 5300
F 0 "#PWR037" H 1400 5150 50  0001 C CNN
F 1 "+BATT" H 1400 5440 50  0000 C CNN
F 2 "" H 1400 5300 50  0000 C CNN
F 3 "" H 1400 5300 50  0000 C CNN
	1    1400 5300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 58359F52
P 1100 5850
F 0 "#PWR038" H 1100 5600 50  0001 C CNN
F 1 "GND" H 1100 5700 50  0000 C CNN
F 2 "" H 1100 5850 50  0000 C CNN
F 3 "" H 1100 5850 50  0000 C CNN
	1    1100 5850
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R R13
U 1 1 58359F53
P 1600 5400
F 0 "R13" V 1500 5400 50  0000 C CNN
F 1 "270K" V 1600 5400 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1530 5400 50  0001 C CNN
F 3 "" H 1600 5400 50  0000 C CNN
	1    1600 5400
	0    1    1    0   
$EndComp
$Comp
L NovaBox:R R14
U 1 1 58359F54
P 1500 5600
F 0 "R14" V 1400 5600 50  0000 C CNN
F 1 "620K" V 1500 5600 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1430 5600 50  0001 C CNN
F 3 "" H 1500 5600 50  0000 C CNN
	1    1500 5600
	0    1    1    0   
$EndComp
Text Notes 800  4700 0    60   ~ 0
>3.48V
Text Notes 800  5550 0    60   ~ 0
>3.6V
Text Notes 800  6400 0    60   ~ 0
>3.78V
$Comp
L NovaBox:R R27
U 1 1 583C9A42
P 1600 3050
F 0 "R27" V 1500 3050 50  0000 C CNN
F 1 "10K" V 1600 3050 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1530 3050 50  0001 C CNN
F 3 "" H 1600 3050 50  0000 C CNN
	1    1600 3050
	0    1    1    0   
$EndComp
NoConn ~ 6100 7300
NoConn ~ 6100 7600
NoConn ~ 6500 7300
NoConn ~ 6500 7600
$Comp
L NovaBox:CONN_01X02 SW6
U 1 1 580D1AA2
P 5200 6200
F 0 "SW6" H 5200 6350 50  0000 C CNN
F 1 "ON/OFF" V 5300 6200 50  0000 C CNN
F 2 "NovaBox:Switch_2.5mm" H 5200 6200 50  0001 C CNN
F 3 "" H 5200 6200 50  0000 C CNN
	1    5200 6200
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:C C17
U 1 1 5848D02E
P 1650 4900
F 0 "C17" V 1700 5000 50  0000 L CNN
F 1 "1uF" V 1700 4650 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1688 4750 50  0001 C CNN
F 3 "" H 1650 4900 50  0000 C CNN
	1    1650 4900
	0    1    1    0   
$EndComp
$Comp
L NovaBox:C C18
U 1 1 5848F206
P 1650 5750
F 0 "C18" V 1700 5850 50  0000 L CNN
F 1 "1uF" V 1700 5500 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1688 5600 50  0001 C CNN
F 3 "" H 1650 5750 50  0000 C CNN
	1    1650 5750
	0    1    1    0   
$EndComp
$Comp
L NovaBox:C C19
U 1 1 5848F7DF
P 1650 6600
F 0 "C19" V 1700 6700 50  0000 L CNN
F 1 "1uF" V 1700 6350 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1688 6450 50  0001 C CNN
F 3 "" H 1650 6600 50  0000 C CNN
	1    1650 6600
	0    1    1    0   
$EndComp
$Comp
L NovaBox:LED_RABG D1
U 1 1 584892BE
P 1200 1000
F 0 "D1" H 1200 1350 50  0000 C CNN
F 1 "LED_RABG" H 1225 650 50  0000 C CNN
F 2 "NovaBox:PLCC4" H 1150 950 50  0001 C CNN
F 3 "" H 1150 950 50  0000 C CNN
	1    1200 1000
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR045
U 1 1 5849038E
P 800 900
F 0 "#PWR045" H 800 750 50  0001 C CNN
F 1 "+BATT" H 800 1040 50  0000 C CNN
F 2 "" H 800 900 50  0000 C CNN
F 3 "" H 800 900 50  0000 C CNN
	1    800  900 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1250 3300 1350 3300
Wire Wire Line
	1750 3300 1850 3300
Connection ~ 1350 3300
Wire Wire Line
	1500 2150 1550 2150
Wire Wire Line
	1200 2150 1100 2150
Wire Wire Line
	1550 2400 1500 2400
Connection ~ 1550 2150
Wire Wire Line
	1550 2650 1500 2650
Wire Wire Line
	1100 2400 1200 2400
Wire Wire Line
	1100 2650 1200 2650
Wire Wire Line
	5400 5250 5400 5400
Wire Wire Line
	1500 1900 1550 1900
Wire Wire Line
	1100 1900 1200 1900
Wire Wire Line
	1500 1650 1550 1650
Connection ~ 1550 1900
Wire Wire Line
	1100 1650 1200 1650
Wire Wire Line
	1900 2150 1950 2150
Wire Wire Line
	1950 2150 1950 1900
Wire Wire Line
	1550 1650 1550 1900
Wire Wire Line
	8400 5750 8450 5750
Wire Wire Line
	8450 5650 8450 5750
Wire Wire Line
	8100 5350 8100 5450
Wire Wire Line
	8450 5200 8450 5350
Wire Wire Line
	8450 5000 8450 4900
Wire Wire Line
	8450 4900 8100 4900
Wire Wire Line
	8100 4850 8100 4900
Connection ~ 8450 5750
Wire Wire Line
	8450 6150 8450 6200
Wire Wire Line
	8450 6200 8100 6200
Wire Wire Line
	8100 5950 8100 6200
Connection ~ 8100 6200
Wire Wire Line
	7950 5450 8100 5450
Connection ~ 8100 5450
Connection ~ 8100 4900
Connection ~ 5400 5400
Wire Wire Line
	5400 6400 5750 6400
Connection ~ 1550 2400
Wire Wire Line
	1800 4550 1900 4550
Wire Wire Line
	1900 4550 1900 4750
Wire Wire Line
	1650 4750 1900 4750
Connection ~ 1900 4750
Wire Wire Line
	1100 4750 1100 4900
Wire Wire Line
	1100 4750 1350 4750
Wire Wire Line
	1400 4500 1400 4550
Wire Wire Line
	1400 4550 1500 4550
Wire Wire Line
	2800 4650 3200 4650
Wire Wire Line
	3600 4650 4050 4650
Wire Wire Line
	4350 4650 4500 4650
Wire Wire Line
	1750 5400 1850 5400
Wire Wire Line
	1850 5400 1850 5600
Wire Wire Line
	1650 5600 1850 5600
Wire Wire Line
	1100 5600 1100 5750
Wire Wire Line
	1100 5600 1350 5600
Wire Wire Line
	1400 5300 1400 5400
Wire Wire Line
	1400 5400 1450 5400
Wire Wire Line
	1750 6250 1850 6250
Wire Wire Line
	1850 6250 1850 6450
Wire Wire Line
	1650 6450 1850 6450
Wire Wire Line
	1100 6450 1100 6600
Wire Wire Line
	1100 6450 1350 6450
Wire Wire Line
	3900 5000 4050 5000
Wire Wire Line
	4350 5000 4500 5000
Wire Wire Line
	3800 5350 4050 5350
Wire Wire Line
	4500 5350 4350 5350
Wire Wire Line
	3700 5700 4050 5700
Wire Wire Line
	4500 5700 4350 5700
Wire Wire Line
	4500 4650 4500 5000
Wire Wire Line
	2800 5500 2950 5500
Wire Wire Line
	2800 6350 3050 6350
Wire Wire Line
	2800 7200 3150 7200
Wire Wire Line
	1400 6250 1450 6250
Connection ~ 4500 5000
Connection ~ 4500 5700
Connection ~ 4500 5350
Wire Wire Line
	2950 5500 2950 4750
Wire Wire Line
	2950 4750 3200 4750
Wire Wire Line
	3200 4850 3050 4850
Wire Wire Line
	3050 4850 3050 6350
Wire Wire Line
	3150 7200 3150 4950
Wire Wire Line
	3150 4950 3200 4950
Wire Wire Line
	3600 4750 3900 4750
Wire Wire Line
	3900 4750 3900 5000
Wire Wire Line
	3600 4850 3800 4850
Wire Wire Line
	3800 4850 3800 5350
Wire Wire Line
	3700 5700 3700 4950
Wire Wire Line
	3700 4950 3600 4950
Wire Wire Line
	1400 6150 1400 6250
Wire Wire Line
	1250 3050 1450 3050
Wire Wire Line
	1750 3050 1850 3050
Wire Wire Line
	1850 3050 1850 3300
Connection ~ 1850 3300
Wire Wire Line
	1900 4900 1750 4900
Wire Wire Line
	1850 6600 1750 6600
Connection ~ 1850 6450
Wire Wire Line
	1850 5750 1750 5750
Connection ~ 1850 5600
Wire Wire Line
	1550 4900 1100 4900
Connection ~ 1100 4900
Wire Wire Line
	1550 5750 1100 5750
Connection ~ 1100 5750
Wire Wire Line
	1550 6600 1100 6600
Connection ~ 1100 6600
Wire Wire Line
	900  1000 800  1000
Wire Wire Line
	800  1000 800  900 
Wire Wire Line
	1500 1200 1600 1200
Wire Wire Line
	1500 1000 1500 900 
Wire Wire Line
	1500 900  1600 900 
Wire Wire Line
	1500 800  1550 800 
Wire Wire Line
	1550 800  1550 1100
Wire Wire Line
	1550 1100 1600 1100
Wire Wire Line
	2100 900  2000 900 
Wire Wire Line
	6100 5400 6100 6100
Wire Wire Line
	5400 6250 5400 6400
$Comp
L power:GND #PWR049
U 1 1 58A504DB
P 6450 6500
F 0 "#PWR049" H 6450 6250 50  0001 C CNN
F 1 "GND" H 6450 6350 50  0000 C CNN
F 2 "" H 6450 6500 50  0000 C CNN
F 3 "" H 6450 6500 50  0000 C CNN
	1    6450 6500
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R_Pack04 RP1
U 1 1 58D73ED0
P 3400 4850
F 0 "RP1" V 3100 4850 50  0000 C CNN
F 1 "R_Pack04" V 3600 4850 50  0000 C CNN
F 2 "NovaBox:Resistor_Array_x4_1206" V 3675 4850 50  0001 C CNN
F 3 "" H 3400 4850 50  0001 C CNN
	1    3400 4850
	0    1    1    0   
$EndComp
$Comp
L NovaBox:R_Pack04 RP2
U 1 1 58D75DF3
P 1800 1000
F 0 "RP2" V 1500 1000 50  0000 C CNN
F 1 "R_Pack04" V 2000 1000 50  0000 C CNN
F 2 "NovaBox:Resistor_Array_x4_1206" V 2075 1000 50  0001 C CNN
F 3 "" H 1800 1000 50  0001 C CNN
	1    1800 1000
	0    -1   -1   0   
$EndComp
$Comp
L NovaBox:SW_SIMPLE SW1
U 1 1 58D6D804
P 1350 1650
F 0 "SW1" H 1350 1600 40  0000 C CNN
F 1 "PIO18" H 1350 1750 40  0001 C CNN
F 2 "NovaBox:Switch_2.5mm" H 1350 1650 60  0001 C CNN
F 3 "" H 1350 1650 60  0000 C CNN
	1    1350 1650
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:SW_SIMPLE SW2
U 1 1 58D6F42A
P 1350 1900
F 0 "SW2" H 1350 1850 40  0000 C CNN
F 1 "PIO21" H 1350 2000 40  0001 C CNN
F 2 "NovaBox:Switch_2.5mm" H 1350 1900 60  0001 C CNN
F 3 "" H 1350 1900 60  0000 C CNN
	1    1350 1900
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:SW_SIMPLE SW3
U 1 1 58D6FE51
P 1350 2150
F 0 "SW3" H 1350 2100 40  0000 C CNN
F 1 "PIO8" H 1350 2250 40  0001 C CNN
F 2 "NovaBox:Switch_2.5mm" H 1350 2150 60  0001 C CNN
F 3 "" H 1350 2150 60  0000 C CNN
	1    1350 2150
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:SW_SIMPLE SW4
U 1 1 58D71307
P 1350 2400
F 0 "SW4" H 1350 2350 40  0000 C CNN
F 1 "PIO20" H 1350 2500 40  0001 C CNN
F 2 "NovaBox:Switch_2.5mm" H 1350 2400 60  0001 C CNN
F 3 "" H 1350 2400 60  0000 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:SW_SIMPLE SW5
U 1 1 58D735E5
P 1350 2650
F 0 "SW5" H 1350 2600 40  0000 C CNN
F 1 "PIO19" H 1350 2750 40  0001 C CNN
F 2 "NovaBox:Switch_2.5mm" H 1350 2650 60  0001 C CNN
F 3 "" H 1350 2650 60  0000 C CNN
	1    1350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5900 5400 6150
Wire Wire Line
	6300 6400 6450 6400
Wire Wire Line
	6450 6400 6450 6500
Wire Wire Line
	6100 5400 5750 5400
Wire Wire Line
	1350 3300 1450 3300
Wire Wire Line
	1550 2150 1600 2150
Wire Wire Line
	1550 2150 1550 2400
Wire Wire Line
	1550 1900 1550 2150
Wire Wire Line
	8450 5750 8450 5850
Wire Wire Line
	8100 6200 8100 6300
Wire Wire Line
	8100 5450 8100 5550
Wire Wire Line
	8100 4900 8100 5050
Wire Wire Line
	5400 5400 5400 5500
Wire Wire Line
	1550 2400 1550 2650
Wire Wire Line
	1900 4750 1900 4900
Wire Wire Line
	4500 5000 4500 5350
Wire Wire Line
	4500 5700 4500 5750
Wire Wire Line
	4500 5350 4500 5700
Wire Wire Line
	1850 3300 1950 3300
Wire Wire Line
	1850 6450 1850 6600
Wire Wire Line
	1850 5600 1850 5750
Wire Wire Line
	1100 4900 1100 5000
Wire Wire Line
	1100 5750 1100 5850
Wire Wire Line
	1100 6600 1100 6650
$Comp
L power:+BATT #PWR050
U 1 1 5B70E63D
P 1400 7000
F 0 "#PWR050" H 1400 6850 50  0001 C CNN
F 1 "+BATT" H 1400 7140 50  0000 C CNN
F 2 "" H 1400 7000 50  0000 C CNN
F 3 "" H 1400 7000 50  0000 C CNN
	1    1400 7000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 5B70E643
P 1100 7500
F 0 "#PWR051" H 1100 7250 50  0001 C CNN
F 1 "GND" H 1100 7350 50  0000 C CNN
F 2 "" H 1100 7500 50  0000 C CNN
F 3 "" H 1100 7500 50  0000 C CNN
	1    1100 7500
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R R10
U 1 1 5B70E649
P 1600 7100
F 0 "R10" V 1500 7100 50  0000 C CNN
F 1 "270K" V 1600 7100 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1530 7100 50  0001 C CNN
F 3 "" H 1600 7100 50  0000 C CNN
	1    1600 7100
	0    1    1    0   
$EndComp
$Comp
L NovaBox:R R17
U 1 1 5B70E650
P 1500 7300
F 0 "R17" V 1400 7300 50  0000 C CNN
F 1 "470K" V 1500 7300 50  0000 C CNN
F 2 "NovaBox:R_0805" V 1430 7300 50  0001 C CNN
F 3 "" H 1500 7300 50  0000 C CNN
	1    1500 7300
	0    1    1    0   
$EndComp
$Comp
L NovaBox:C C22
U 1 1 5B70E657
P 1650 7450
F 0 "C22" V 1700 7550 50  0000 L CNN
F 1 "1uF" V 1700 7200 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1688 7300 50  0001 C CNN
F 3 "" H 1650 7450 50  0000 C CNN
	1    1650 7450
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 7100 1850 7100
Wire Wire Line
	1850 7100 1850 7300
Wire Wire Line
	1650 7300 1850 7300
Wire Wire Line
	1100 7300 1100 7450
Wire Wire Line
	1100 7300 1350 7300
Wire Wire Line
	1400 7100 1450 7100
Wire Wire Line
	1400 7000 1400 7100
Wire Wire Line
	1850 7450 1750 7450
Connection ~ 1850 7300
Wire Wire Line
	1550 7450 1100 7450
Connection ~ 1100 7450
Wire Wire Line
	1850 7300 1850 7450
Wire Wire Line
	1100 7450 1100 7500
Text GLabel 9100 5850 0    60   Input ~ 0
1V8
$Comp
L power:+BATT #PWR030
U 1 1 5B7968FB
P 9800 5150
F 0 "#PWR030" H 9800 5000 50  0001 C CNN
F 1 "+BATT" H 9800 5290 50  0000 C CNN
F 2 "" H 9800 5150 50  0000 C CNN
F 3 "" H 9800 5150 50  0000 C CNN
	1    9800 5150
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:R R1
U 1 1 5B7973DA
P 9800 5400
F 0 "R1" V 9700 5400 50  0000 C CNN
F 1 "10K" V 9800 5400 50  0000 C CNN
F 2 "NovaBox:R_0805" V 9730 5400 50  0001 C CNN
F 3 "" H 9800 5400 50  0000 C CNN
	1    9800 5400
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:MMBT3904 Q5
U 1 1 5B79793D
P 9700 5850
F 0 "Q5" H 9900 5925 50  0000 L CNN
F 1 "MMBT3904" H 9900 5850 50  0000 L CNN
F 2 "NovaBox:SOT-23" H 9900 5775 50  0001 L CIN
F 3 "" H 9700 5850 50  0000 L CNN
	1    9700 5850
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:R R2
U 1 1 5B797AAF
P 9300 5850
F 0 "R2" V 9200 5850 50  0000 C CNN
F 1 "10K" V 9300 5850 50  0000 C CNN
F 2 "NovaBox:R_0805" V 9230 5850 50  0001 C CNN
F 3 "" H 9300 5850 50  0000 C CNN
	1    9300 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5B7982B1
P 9800 6300
F 0 "#PWR039" H 9800 6050 50  0001 C CNN
F 1 "GND" H 9800 6150 50  0000 C CNN
F 2 "" H 9800 6300 50  0000 C CNN
F 3 "" H 9800 6300 50  0000 C CNN
	1    9800 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 5850 9150 5850
Wire Wire Line
	9800 5550 9800 5600
Wire Wire Line
	9800 6050 9800 6300
Wire Wire Line
	9800 5150 9800 5200
Wire Wire Line
	10050 5600 9800 5600
Connection ~ 9800 5600
Wire Wire Line
	9800 5600 9800 5650
Wire Wire Line
	9800 5200 10350 5200
Wire Wire Line
	10350 5200 10350 5400
Connection ~ 9800 5200
Wire Wire Line
	9800 5200 9800 5250
$Comp
L NovaBox:R R3
U 1 1 5B856468
P 10350 6050
F 0 "R3" V 10250 6050 50  0000 C CNN
F 1 "10K" V 10350 6050 50  0000 C CNN
F 2 "NovaBox:R_0805" V 10280 6050 50  0001 C CNN
F 3 "" H 10350 6050 50  0000 C CNN
	1    10350 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 5800 10350 5850
$Comp
L power:GND #PWR046
U 1 1 5B87260E
P 10350 6300
F 0 "#PWR046" H 10350 6050 50  0001 C CNN
F 1 "GND" H 10350 6150 50  0000 C CNN
F 2 "" H 10350 6300 50  0000 C CNN
F 3 "" H 10350 6300 50  0000 C CNN
	1    10350 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 6200 10350 6300
Text GLabel 10700 5850 2    60   Input ~ 0
VR_SHDN
Wire Wire Line
	10700 5850 10350 5850
Connection ~ 10350 5850
Wire Wire Line
	10350 5850 10350 5900
$Comp
L NovaBox:PMOS Q3
U 1 1 5B69022E
P 10250 5600
F 0 "Q3" H 10455 5646 50  0000 L CNN
F 1 "IRLML6401" H 10455 5555 50  0000 L CNN
F 2 "NovaBox:SOT-23" H 10450 5700 50  0001 C CNN
F 3 "" H 10250 5600 50  0001 L CNN
	1    10250 5600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 5B78AAC5
P 3400 6100
F 0 "#PWR0101" H 3400 5950 50  0001 C CNN
F 1 "VCC" H 3417 6273 50  0000 C CNN
F 2 "" H 3400 6100 50  0001 C CNN
F 3 "" H 3400 6100 50  0001 C CNN
	1    3400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 6100 3400 6200
Wire Wire Line
	3400 6200 3650 6200
Wire Wire Line
	3650 6200 3650 6100
Wire Wire Line
	9450 5850 9500 5850
$Comp
L NovaBox:R R5
U 1 1 5B8EE109
P 5750 6150
F 0 "R5" V 5650 6150 50  0000 C CNN
F 1 "1K" V 5750 6150 50  0000 C CNN
F 2 "NovaBox:R_0805" V 5680 6150 50  0001 C CNN
F 3 "" H 5750 6150 50  0000 C CNN
	1    5750 6150
	-1   0    0    1   
$EndComp
$Comp
L NovaBox:LED D2
U 1 1 5B8EE20F
P 5750 5700
F 0 "D2" H 5750 5600 50  0000 C CNN
F 1 "REVERSE_BATT" H 5750 5800 50  0000 C CNN
F 2 "NovaBox:LED_0805" H 5750 5700 50  0001 C CNN
F 3 "" H 5750 5700 50  0000 C CNN
	1    5750 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 5550 5750 5400
Connection ~ 5750 5400
Wire Wire Line
	5750 5400 5400 5400
Wire Wire Line
	5750 5850 5750 6000
Wire Wire Line
	5750 6300 5750 6400
Connection ~ 5750 6400
Wire Wire Line
	5750 6400 5900 6400
Text Notes 6200 5850 0    60   ~ 0
battery with reverse\nprotection and\nLED indicator
Text Notes 9550 5550 2    60   ~ 0
power section\nenabler\n
Text Notes 8000 5300 2    60   ~ 0
CSR8635 wake up\non power-on\n
Wire Wire Line
	1850 7300 2250 7300
Wire Wire Line
	2250 7100 2200 7100
Wire Wire Line
	2200 4550 2250 4550
Wire Wire Line
	2250 4750 1900 4750
Wire Wire Line
	2250 5400 2200 5400
Wire Wire Line
	2250 5600 1850 5600
Wire Wire Line
	2250 6250 2200 6250
Wire Wire Line
	2250 6450 1850 6450
Text Notes 850  7200 0    60   ~ 0
>3.95V
Text Label 5400 6000 0    50   ~ 0
-BATT
Wire Wire Line
	1350 3300 1350 3400
Wire Wire Line
	1350 3600 1350 3700
$Comp
L NovaBox:SPK S1
U 1 1 5809A47F
P 5500 7050
F 0 "S1" H 5500 7200 50  0000 C CNN
F 1 "SPK_L" H 5500 6900 50  0000 C CNN
F 2 "NovaBox:SPKR" H 5500 7050 50  0001 C CNN
F 3 "" H 5500 7050 50  0000 C CNN
	1    5500 7050
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:SPK S2
U 1 1 5809ADAC
P 5500 7500
F 0 "S2" H 5500 7650 50  0000 C CNN
F 1 "SPK_R" H 5500 7350 50  0000 C CNN
F 2 "NovaBox:SPKR" H 5500 7500 50  0001 C CNN
F 3 "" H 5500 7500 50  0000 C CNN
	1    5500 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3200 5350 3750
Wire Wire Line
	5450 3650 5450 3200
Wire Wire Line
	4100 2450 4100 2500
Wire Wire Line
	4150 2450 4100 2450
$Comp
L power:GND #PWR0103
U 1 1 5D9DE9B9
P 4100 2500
F 0 "#PWR0103" H 4100 2250 50  0001 C CNN
F 1 "GND" H 4100 2350 50  0000 C CNN
F 2 "" H 4100 2500 50  0000 C CNN
F 3 "" H 4100 2500 50  0000 C CNN
	1    4100 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4000 2350 4150 2350
Text GLabel 4000 2350 0    60   Input ~ 0
1V8
NoConn ~ 4100 4050
Wire Wire Line
	4000 1950 4150 1950
Wire Wire Line
	4000 1900 4000 1950
Wire Wire Line
	3900 1900 4000 1900
Text GLabel 3900 1900 0    60   Input ~ 0
VBUS
Wire Wire Line
	3750 2250 4150 2250
Text GLabel 3750 2250 0    60   Input ~ 0
PWER_E
Wire Wire Line
	3900 2050 4150 2050
Wire Wire Line
	4150 1550 3350 1550
Wire Wire Line
	3350 1450 4150 1450
Wire Wire Line
	4150 1350 3350 1350
Wire Wire Line
	3350 1250 4150 1250
Wire Wire Line
	3400 1650 3400 1700
Wire Wire Line
	3350 1650 3400 1650
Text Label 4850 3750 0    60   ~ 0
D-
Text Label 4850 3650 0    60   ~ 0
D+
Wire Wire Line
	4300 4050 4300 4150
Wire Wire Line
	4600 3450 4800 3450
Wire Wire Line
	4600 3750 5350 3750
Wire Wire Line
	4600 3650 5450 3650
Wire Wire Line
	4000 1650 4150 1650
NoConn ~ 4600 3850
Text GLabel 4800 3450 2    60   Input ~ 0
VBUS
NoConn ~ 4200 4050
$Comp
L power:GND #PWR042
U 1 1 58457BF3
P 4300 4150
F 0 "#PWR042" H 4300 3900 50  0001 C CNN
F 1 "GND" H 4300 4000 50  0000 C CNN
F 2 "" H 4300 4150 50  0000 C CNN
F 3 "" H 4300 4150 50  0000 C CNN
	1    4300 4150
	-1   0    0    -1  
$EndComp
$Comp
L NovaBox:USB_OTG P5
U 1 1 584566EB
P 4300 3650
F 0 "P5" H 4150 4000 50  0000 C CNN
F 1 "USB" H 4400 4000 50  0000 C CNN
F 2 "NovaBox:USB_MiniB_THT" V 4250 3550 50  0001 C CNN
F 3 "" V 4250 3550 50  0000 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
$Comp
L NovaBox:CSR_DebugSmall U3
U 1 1 580CF046
P 3350 1450
F 0 "U3" H 3600 1150 60  0000 C CNN
F 1 "CSR_DebugSmall" H 3600 1750 60  0000 C CNN
F 2 "NovaBox:CSR_DebugSmall" H 3350 1450 60  0001 C CNN
F 3 "" H 3350 1450 60  0001 C CNN
	1    3350 1450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 580CF7EC
P 3400 1700
F 0 "#PWR011" H 3400 1450 50  0001 C CNN
F 1 "GND" H 3400 1550 50  0000 C CNN
F 2 "" H 3400 1700 50  0000 C CNN
F 3 "" H 3400 1700 50  0000 C CNN
	1    3400 1700
	-1   0    0    -1  
$EndComp
Text GLabel 3900 2050 0    60   Input ~ 0
CSR_RST
Text GLabel 4000 1650 0    60   Input ~ 0
SPI_PCM
$Comp
L NovaBox:CSR8645_MODULE U4
U 1 1 5D858F31
P 5150 1650
F 0 "U4" H 5150 2600 60  0000 C CNN
F 1 "CSR8645_MODULE" H 5150 2400 60  0000 C CNN
F 2 "NovaBox:CSR8645_MODULE" H 5150 1650 60  0001 C CNN
F 3 "" H 5150 1650 60  0000 C CNN
	1    5150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 5D9F6E21
P 3300 2100
F 0 "#PWR?" H 3300 1950 50  0001 C CNN
F 1 "+BATT" H 3300 2240 50  0000 C CNN
F 2 "" H 3300 2100 50  0000 C CNN
F 3 "" H 3300 2100 50  0000 C CNN
	1    3300 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 2150 4150 2150
Wire Wire Line
	3300 2100 3300 2150
Text GLabel 2200 4550 0    60   Input ~ 0
1V8
Text GLabel 2200 5400 0    60   Input ~ 0
1V8
Text GLabel 2200 6250 0    60   Input ~ 0
1V8
Text GLabel 2200 7100 0    60   Input ~ 0
1V8
$Comp
L NovaBox:C C?
U 1 1 5DA23D8E
P 1850 3500
F 0 "C?" H 1875 3600 50  0000 L CNN
F 1 "1uF" H 1875 3400 50  0000 L CNN
F 2 "NovaBox:C_0805" H 1888 3350 50  0001 C CNN
F 3 "" H 1850 3500 50  0000 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA24C70
P 1850 3700
F 0 "#PWR?" H 1850 3450 50  0001 C CNN
F 1 "GND" H 1850 3550 50  0000 C CNN
F 2 "" H 1850 3700 50  0000 C CNN
F 3 "" H 1850 3700 50  0000 C CNN
	1    1850 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1850 3400 1850 3300
Wire Wire Line
	1850 3700 1850 3600
Text GLabel 6250 2150 2    60   Input ~ 0
PIO18
Text GLabel 6600 1850 2    60   Input ~ 0
PIO21
Text GLabel 6600 2250 2    60   Input ~ 0
PIO8
Text GLabel 6600 2050 2    60   Input ~ 0
PIO19
Text GLabel 6250 1950 2    60   Input ~ 0
PIO20
Wire Wire Line
	6150 1850 6600 1850
Wire Wire Line
	6250 1950 6150 1950
Wire Wire Line
	6150 2050 6600 2050
Wire Wire Line
	6250 2150 6150 2150
Wire Wire Line
	6150 2250 6600 2250
Wire Wire Line
	2400 1050 2400 1200
Wire Wire Line
	2000 1200 2400 1200
Wire Wire Line
	2400 1050 4150 1050
Wire Wire Line
	2250 950  4150 950 
Wire Wire Line
	2100 850  2100 900 
Wire Wire Line
	2100 850  4150 850 
Wire Wire Line
	2000 1100 2250 1100
Wire Wire Line
	2250 950  2250 1100
$Comp
L power:+BATT #PWR?
U 1 1 5DAEA151
P 3650 6100
F 0 "#PWR?" H 3650 5950 50  0001 C CNN
F 1 "+BATT" H 3650 6240 50  0000 C CNN
F 2 "" H 3650 6100 50  0000 C CNN
F 3 "" H 3650 6100 50  0000 C CNN
	1    3650 6100
	-1   0    0    -1  
$EndComp
$EndSCHEMATC