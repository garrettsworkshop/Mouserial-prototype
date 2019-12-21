EESchema Schematic File Version 4
LIBS:mouserial-keymouse-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C1
U 1 1 5C57F2AE
P 3400 4400
F 0 "C1" H 3492 4446 50  0000 L CNN
F 1 "100n" H 3492 4355 50  0000 L CNN
F 2 "stdpads:C_0805" H 3400 4400 50  0001 C CNN
F 3 "~" H 3400 4400 50  0001 C CNN
	1    3400 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5C57F5E4
P 6500 4000
F 0 "#PWR015" H 6500 3750 50  0001 C CNN
F 1 "GND" V 6500 3800 50  0000 C CNN
F 2 "" H 6500 4000 50  0001 C CNN
F 3 "" H 6500 4000 50  0001 C CNN
	1    6500 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5C57F61D
P 5900 4000
F 0 "#PWR012" H 5900 3850 50  0001 C CNN
F 1 "+5V" H 5900 4150 50  0000 C CNN
F 2 "" H 5900 4000 50  0001 C CNN
F 3 "" H 5900 4000 50  0001 C CNN
	1    5900 4000
	0    -1   -1   0   
$EndComp
Text Label 6500 3900 0    50   ~ 0
MClk
Text Label 6500 4100 0    50   ~ 0
MDat
NoConn ~ 5900 3900
NoConn ~ 5900 4100
$Comp
L StandardParts:MiniDIN-6 J2
U 1 1 5C59A3CD
P 6200 4000
F 0 "J2" H 6200 4367 50  0000 C CNN
F 1 "Mouse" H 6200 4276 50  0000 C CNN
F 2 "stdpads:MD-60" H 6150 3650 50  0001 C CNN
F 3 "" H 6150 3650 50  0001 C CNN
	1    6200 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5C59A48B
P 5900 4200
F 0 "#PWR013" H 5900 3950 50  0001 C CNN
F 1 "GND" H 5905 4027 50  0000 C CNN
F 2 "" H 5900 4200 50  0001 C CNN
F 3 "" H 5900 4200 50  0001 C CNN
	1    5900 4200
	1    0    0    -1  
$EndComp
Text Label 3900 4100 2    50   ~ 0
MClk
$Comp
L power:GND #PWR04
U 1 1 5C57F31A
P 3400 4500
F 0 "#PWR04" H 3400 4250 50  0001 C CNN
F 1 "GND" H 3400 4350 50  0000 C CNN
F 2 "" H 3400 4500 50  0001 C CNN
F 3 "" H 3400 4500 50  0001 C CNN
	1    3400 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 5D328F12
P 4100 4200
F 0 "J1" H 4150 4517 50  0000 C CNN
F 1 "Mouserial" H 4150 4426 50  0000 C CNN
F 2 "stdpads:IDC_SMD_2x04_P2.54mm_Vertical" H 4100 4200 50  0001 C CNN
F 3 "~" H 4100 4200 50  0001 C CNN
	1    4100 4200
	1    0    0    -1  
$EndComp
Text Label 3900 4400 2    50   ~ 0
MDat
Text Label 4400 4200 0    50   ~ 0
KClk
Text Label 4400 4400 0    50   ~ 0
KDat
$Comp
L power:GND #PWR0101
U 1 1 5D329B9D
P 4700 4300
F 0 "#PWR0101" H 4700 4050 50  0001 C CNN
F 1 "GND" H 4705 4127 50  0000 C CNN
F 2 "" H 4700 4300 50  0001 C CNN
F 3 "" H 4700 4300 50  0001 C CNN
	1    4700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4300 4400 4300
Wire Wire Line
	4400 4100 4700 4100
Wire Wire Line
	4700 4100 4700 4300
Connection ~ 4700 4300
Wire Wire Line
	3600 4300 3900 4300
$Comp
L power:+5V #PWR0103
U 1 1 5D32AA9D
P 3100 4200
F 0 "#PWR0103" H 3100 4050 50  0001 C CNN
F 1 "+5V" H 3115 4373 50  0000 C CNN
F 2 "" H 3100 4200 50  0001 C CNN
F 3 "" H 3100 4200 50  0001 C CNN
	1    3100 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:Polyfuse_Small F1
U 1 1 5D30BE58
P 3300 4200
F 0 "F1" V 3095 4200 50  0000 C CNN
F 1 "1A" V 3186 4200 50  0000 C CNN
F 2 "stdpads:BelFuse_1206" H 3350 4000 50  0001 L CNN
F 3 "~" H 3300 4200 50  0001 C CNN
	1    3300 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 4200 3200 4200
Wire Wire Line
	3400 4500 3600 4500
Wire Wire Line
	3600 4500 3600 4300
Connection ~ 3400 4500
Wire Wire Line
	3400 4200 3400 4300
Wire Wire Line
	3400 4200 3900 4200
Connection ~ 3400 4200
$Comp
L power:GND #PWR0102
U 1 1 5D314D06
P 6500 4700
F 0 "#PWR0102" H 6500 4450 50  0001 C CNN
F 1 "GND" V 6500 4500 50  0000 C CNN
F 2 "" H 6500 4700 50  0001 C CNN
F 3 "" H 6500 4700 50  0001 C CNN
	1    6500 4700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5D314D0C
P 5900 4700
F 0 "#PWR0104" H 5900 4550 50  0001 C CNN
F 1 "+5V" H 5900 4850 50  0000 C CNN
F 2 "" H 5900 4700 50  0001 C CNN
F 3 "" H 5900 4700 50  0001 C CNN
	1    5900 4700
	0    -1   -1   0   
$EndComp
Text Label 6500 4600 0    50   ~ 0
KClk
Text Label 6500 4800 0    50   ~ 0
KDat
NoConn ~ 5900 4600
NoConn ~ 5900 4800
$Comp
L StandardParts:MiniDIN-6 J3
U 1 1 5D314D16
P 6200 4700
F 0 "J3" H 6200 5067 50  0000 C CNN
F 1 "Keybd" H 6200 4976 50  0000 C CNN
F 2 "stdpads:MD-60" H 6150 4350 50  0001 C CNN
F 3 "" H 6150 4350 50  0001 C CNN
	1    6200 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5D314D1C
P 5900 4900
F 0 "#PWR0105" H 5900 4650 50  0001 C CNN
F 1 "GND" H 5905 4727 50  0000 C CNN
F 2 "" H 5900 4900 50  0001 C CNN
F 3 "" H 5900 4900 50  0001 C CNN
	1    5900 4900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID1
U 1 1 5D32713E
P 3450 2850
F 0 "FID1" H 3535 2896 50  0000 L CNN
F 1 "Fiducial" H 3535 2805 50  0000 L CNN
F 2 "stdpads:Fiducial" H 3450 2850 50  0001 C CNN
F 3 "~" H 3450 2850 50  0001 C CNN
	1    3450 2850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 5D327596
P 3450 3100
F 0 "FID2" H 3535 3146 50  0000 L CNN
F 1 "Fiducial" H 3535 3055 50  0000 L CNN
F 2 "stdpads:Fiducial" H 3450 3100 50  0001 C CNN
F 3 "~" H 3450 3100 50  0001 C CNN
	1    3450 3100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID3
U 1 1 5D327E8E
P 3450 3350
F 0 "FID3" H 3535 3396 50  0000 L CNN
F 1 "Fiducial" H 3535 3305 50  0000 L CNN
F 2 "stdpads:Fiducial" H 3450 3350 50  0001 C CNN
F 3 "~" H 3450 3350 50  0001 C CNN
	1    3450 3350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID4
U 1 1 5D3281AA
P 3450 3600
F 0 "FID4" H 3535 3646 50  0000 L CNN
F 1 "Fiducial" H 3535 3555 50  0000 L CNN
F 2 "stdpads:Fiducial" H 3450 3600 50  0001 C CNN
F 3 "~" H 3450 3600 50  0001 C CNN
	1    3450 3600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5D326D17
P 3950 2850
F 0 "H1" H 4050 2896 50  0000 L CNN
F 1 "MountingHole" H 4050 2805 50  0000 L CNN
F 2 "stdpads:PasteHole_1.05mm_PTH" H 3950 2850 50  0001 C CNN
F 3 "~" H 3950 2850 50  0001 C CNN
	1    3950 2850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5D3272FF
P 4650 2850
F 0 "H2" H 4750 2896 50  0000 L CNN
F 1 "MountingHole" H 4750 2805 50  0000 L CNN
F 2 "stdpads:PasteHole_1.05mm_PTH" H 4650 2850 50  0001 C CNN
F 3 "~" H 4650 2850 50  0001 C CNN
	1    4650 2850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5D32738D
P 3950 3350
F 0 "H3" H 4050 3396 50  0000 L CNN
F 1 "MountingHole" H 4050 3305 50  0000 L CNN
F 2 "stdpads:PasteHole_1.05mm_PTH" H 3950 3350 50  0001 C CNN
F 3 "~" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5D327619
P 4650 3350
F 0 "H4" H 4750 3396 50  0000 L CNN
F 1 "MountingHole" H 4750 3305 50  0000 L CNN
F 2 "stdpads:PasteHole_1.05mm_PTH" H 4650 3350 50  0001 C CNN
F 3 "~" H 4650 3350 50  0001 C CNN
	1    4650 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5D3291B1
P 3950 2950
F 0 "#PWR0106" H 3950 2700 50  0001 C CNN
F 1 "GND" H 3950 2800 50  0000 C CNN
F 2 "" H 3950 2950 50  0001 C CNN
F 3 "" H 3950 2950 50  0001 C CNN
	1    3950 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D329649
P 3950 3450
F 0 "#PWR0107" H 3950 3200 50  0001 C CNN
F 1 "GND" H 3950 3300 50  0000 C CNN
F 2 "" H 3950 3450 50  0001 C CNN
F 3 "" H 3950 3450 50  0001 C CNN
	1    3950 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5D329A44
P 4650 3450
F 0 "#PWR0108" H 4650 3200 50  0001 C CNN
F 1 "GND" H 4650 3300 50  0000 C CNN
F 2 "" H 4650 3450 50  0001 C CNN
F 3 "" H 4650 3450 50  0001 C CNN
	1    4650 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5D329D95
P 4650 2950
F 0 "#PWR0109" H 4650 2700 50  0001 C CNN
F 1 "GND" H 4650 2800 50  0000 C CNN
F 2 "" H 4650 2950 50  0001 C CNN
F 3 "" H 4650 2950 50  0001 C CNN
	1    4650 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC