EESchema Schematic File Version 4
LIBS:Mouserial-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4300 1250 0    40   ~ 0
S7
Text Notes 1600 1400 2    50   ~ 0
PHI0
Wire Wire Line
	2350 1300 2350 1400
Wire Wire Line
	2350 1400 4450 1400
Wire Wire Line
	4450 1400 4450 1300
Wire Wire Line
	4450 1300 6550 1300
Text Notes 1900 1250 0    40   ~ 0
S3
Text Notes 6700 1250 0    40   ~ 0
S4
Text Notes 6100 1250 0    40   ~ 0
S3
Text Notes 5500 1250 0    40   ~ 0
S2
Text Notes 4900 1250 0    40   ~ 0
S1
Text Notes 3700 1250 0    40   ~ 0
S6
Text Notes 3100 1250 0    40   ~ 0
S5
Wire Wire Line
	3500 1150 3800 1150
Text Notes 2500 1250 0    40   ~ 0
S4
Wire Wire Line
	2000 1250 2300 1250
Wire Wire Line
	2000 1250 2000 1150
Wire Wire Line
	3800 1150 3800 1250
Text Notes 1600 1250 2    50   ~ 0
C7M
Wire Wire Line
	2300 1250 2300 1150
Wire Wire Line
	2300 1150 2600 1150
Wire Wire Line
	2600 1150 2600 1250
Wire Wire Line
	2600 1250 2900 1250
Wire Wire Line
	2900 1250 2900 1150
Wire Wire Line
	2900 1150 3200 1150
Wire Wire Line
	3200 1150 3200 1250
Wire Wire Line
	3200 1250 3500 1250
Wire Wire Line
	3500 1250 3500 1150
Wire Wire Line
	3800 1250 4100 1250
Wire Wire Line
	4100 1250 4100 1150
Wire Wire Line
	4100 1150 4400 1150
Wire Wire Line
	4400 1150 4400 1250
Wire Wire Line
	4400 1250 4700 1250
Wire Wire Line
	4700 1250 4700 1150
Wire Wire Line
	4700 1150 5000 1150
Wire Wire Line
	5000 1150 5000 1250
Wire Wire Line
	5000 1250 5300 1250
Wire Wire Line
	5300 1250 5300 1150
Wire Wire Line
	5300 1150 5600 1150
Wire Wire Line
	5600 1150 5600 1250
Wire Wire Line
	5600 1250 5900 1250
Wire Wire Line
	5900 1250 5900 1150
Wire Wire Line
	5900 1150 6200 1150
Wire Wire Line
	6200 1150 6200 1250
Wire Wire Line
	6200 1250 6500 1250
Wire Wire Line
	6500 1250 6500 1150
Wire Wire Line
	6500 1150 6800 1150
Text Notes 8500 1250 0    40   ~ 0
S7
Wire Wire Line
	6550 1300 6550 1400
Wire Wire Line
	6550 1400 8650 1400
Text Notes 7900 1250 0    40   ~ 0
S6
Text Notes 7300 1250 0    40   ~ 0
S5
Wire Wire Line
	7700 1150 8000 1150
Text Notes 6700 1250 0    40   ~ 0
S4
Wire Wire Line
	8000 1150 8000 1250
Wire Wire Line
	6800 1150 6800 1250
Wire Wire Line
	6800 1250 7100 1250
Wire Wire Line
	7100 1250 7100 1150
Wire Wire Line
	7100 1150 7400 1150
Wire Wire Line
	7400 1150 7400 1250
Wire Wire Line
	7400 1250 7700 1250
Wire Wire Line
	7700 1250 7700 1150
Wire Wire Line
	8000 1250 8300 1250
Wire Wire Line
	8300 1250 8300 1150
Wire Wire Line
	8300 1150 8600 1150
Wire Wire Line
	8600 1150 8600 1250
Wire Wire Line
	8650 1400 8650 1300
Wire Wire Line
	1750 1150 1750 1250
Wire Wire Line
	1750 1150 2000 1150
Wire Wire Line
	1750 1250 1700 1250
Wire Wire Line
	1700 1300 2350 1300
Wire Wire Line
	8900 1250 8900 1150
Wire Wire Line
	8600 1250 8900 1250
Wire Wire Line
	8900 1150 9000 1150
Wire Wire Line
	8650 1300 9000 1300
Text Notes 1300 5550 0    50   ~ 0
S[2:0] = (S == 0) ? 0 : (~Q3~ & PHI1) ? 7 : S+1 @ C7M\nCSEN = S1 | S2 | S3 @ C7M\n\nABankSEL = (A==C0XF) & DEVSEL @ C7M in S7\nAVBlSEL = (A==C0XB) & DEVSEL @ C7M in S7\nAVidSEL = (A==C0XA) & DEVSEL @ C7M in S7\nAArgResSEL = (A==C0X1) & DEVSEL @ C7M in S7\nACmdStatSEL = (A==C0X0) & DEVSEL @ C7M in S7\n\nRArgResSEL = ALE & RA==XXX1\nRCmdStatSEL = ALE & RA==XXX0\n\nIOROMEN = (A==XFFF/X7FF & IOSTRB) ? 0 :\n            (A==CX00 & IOSEL) ? 1 :\n            IOROMEN @ C7M in S7\n\nBank[4:0] = (S3 & ABankSEL & ~R~W) ? D[4:0] @ C7M\nArgRes[7:0] = (~S3~ & RArgResSEL & WR) ? RAD[7:0] :\n                (S3 & AArgResSEL & ~R~W) ? D[7:0] @ C7M\nCmd[7:0] = (S3 & ACmdSEL & ~R~W) ? D[7:0] @ C7M\nArgRX = (~S3~ & RArgResSEL & RD) ? 0 :\n         (S3 & AArgResSEL & ~R~W) ? 1 @ C7M\nCmdRX = (~S3~ & RCmdStatSEL & RD) ? 0 :\n           (S3 & ACmdSEL & ~R~W) ? 1 @ C7M\nCmdDone = (~S3~ & RCmdStatSEL & WR) ? 0 :\n            (S3 & ACmdSEL & ~R~W) ? 1 @ C7M
Text Notes 3750 3800 0    50   ~ 0
R~ALE~ low by Sn. 1 wait-state access from AVR.\nTwo opportunities to read: Sn and Sn+1.\nTwo opportunities to write: Sn+1 and Sn+2
Text Notes 7000 900  0    104  ~ 0
Video Access
Text Notes 4800 900  0    100  ~ 0
6502 CPU Access
Text Notes 2800 900  0    104  ~ 0
Video Access
Wire Bus Line
	8900 1000 8900 3400
Wire Bus Line
	8300 1000 8300 3400
Wire Bus Line
	1750 1000 1750 3400
Wire Bus Line
	2300 950  2300 3450
Wire Bus Line
	2900 1000 2900 3400
Wire Bus Line
	3500 1000 3500 3400
Wire Bus Line
	4100 1000 4100 3400
Wire Bus Line
	4700 1000 4700 3400
Wire Bus Line
	5300 1000 5300 3400
Wire Bus Line
	5900 1000 5900 3400
Wire Bus Line
	6500 950  6500 3450
Wire Bus Line
	7700 1000 7700 3400
Wire Bus Line
	7100 1000 7100 3400
Wire Bus Line
	1650 2850 9050 2850
Wire Bus Line
	1650 1700 9050 1700
Wire Bus Line
	1650 2350 9050 2350
Wire Wire Line
	7800 3200 9000 3200
Wire Wire Line
	8100 3050 9000 3050
Wire Wire Line
	6400 3000 9000 3000
Wire Wire Line
	6400 2900 9000 2900
Wire Wire Line
	7200 2700 9000 2700
Wire Wire Line
	7500 2550 9000 2550
Wire Wire Line
	5800 2500 9000 2500
Wire Wire Line
	5800 2400 9000 2400
Wire Wire Line
	8400 2200 9000 2200
Wire Wire Line
	8700 2050 9000 2050
Wire Wire Line
	7000 2000 9000 2000
Wire Wire Line
	7000 1900 9000 1900
Wire Wire Line
	9000 1750 8950 1750
Wire Wire Line
	8650 1450 9000 1450
Text Notes 1600 3000 2    50   ~ 0
RAD[7:0]
Text Notes 1600 3300 2    50   ~ 0
R~WR~/R~RD~
Text Notes 1600 3150 2    50   ~ 0
RALE
Text Notes 1600 2500 2    50   ~ 0
RAD[7:0]
Text Notes 1600 2800 2    50   ~ 0
R~WR~/R~RD~
Text Notes 1600 2650 2    50   ~ 0
RALE
Text Notes 1600 2000 2    50   ~ 0
RAD[7:0]
Text Notes 1600 2300 2    50   ~ 0
R~WR~/R~RD~
Wire Wire Line
	1700 3200 4200 3200
Wire Wire Line
	1700 3050 3900 3050
Wire Wire Line
	1700 3000 3600 3000
Wire Wire Line
	1700 2900 3600 2900
Wire Wire Line
	1700 2700 3600 2700
Wire Wire Line
	1700 2550 3300 2550
Wire Wire Line
	1700 2500 3000 2500
Wire Wire Line
	1700 2400 3000 2400
Wire Wire Line
	8650 1850 8950 1850
Wire Wire Line
	8950 1850 8950 1750
Wire Wire Line
	1700 2200 2400 2200
Wire Wire Line
	1700 2050 2100 2050
Wire Wire Line
	1700 2000 1800 2000
Wire Wire Line
	1700 1900 1800 1900
Wire Wire Line
	1750 1850 1700 1850
Wire Wire Line
	1700 1550 2350 1550
Wire Wire Line
	1750 1750 2050 1750
Wire Wire Line
	1750 1750 1750 1850
Wire Wire Line
	4600 1900 6600 1900
Wire Wire Line
	4600 2000 6600 2000
Wire Wire Line
	6300 2050 6900 2050
Wire Wire Line
	6000 2200 7200 2200
Wire Wire Line
	6650 1900 6600 2000
Text Notes 6750 2000 0    50   ~ 0
A
Wire Wire Line
	6950 2000 7000 1900
Wire Wire Line
	6950 1900 7000 2000
Wire Wire Line
	6650 2000 6600 1900
Wire Wire Line
	6950 2000 6650 2000
Wire Wire Line
	6650 1900 6950 1900
Text Notes 7950 2000 0    50   ~ 0
D
Wire Wire Line
	6900 2150 8700 2150
Wire Wire Line
	8400 2300 8400 2200
Wire Wire Line
	7200 2300 8400 2300
Wire Wire Line
	8700 2150 8700 2050
Wire Wire Line
	7200 2200 7200 2300
Wire Wire Line
	6900 2050 6900 2150
Wire Wire Line
	3300 2550 3300 2650
Wire Wire Line
	3600 2700 3600 2800
Wire Wire Line
	5100 2650 5100 2550
Wire Wire Line
	3600 2800 4800 2800
Wire Wire Line
	4800 2800 4800 2700
Wire Wire Line
	3300 2650 5100 2650
Text Notes 4350 2500 0    50   ~ 0
D
Wire Wire Line
	3050 2400 3350 2400
Wire Wire Line
	3350 2500 3050 2500
Wire Wire Line
	3050 2500 3000 2400
Wire Wire Line
	3350 2400 3400 2500
Wire Wire Line
	3350 2500 3400 2400
Text Notes 3150 2500 0    50   ~ 0
A
Wire Wire Line
	3050 2400 3000 2500
Wire Wire Line
	3900 3050 3900 3150
Wire Wire Line
	4200 3200 4200 3300
Wire Wire Line
	5700 3150 5700 3050
Wire Wire Line
	4200 3300 5400 3300
Wire Wire Line
	5400 3300 5400 3200
Wire Wire Line
	3900 3150 5700 3150
Text Notes 4950 3000 0    50   ~ 0
D
Wire Wire Line
	3650 2900 3950 2900
Wire Wire Line
	3950 3000 3650 3000
Wire Wire Line
	3650 3000 3600 2900
Wire Wire Line
	3950 2900 4000 3000
Wire Wire Line
	3950 3000 4000 2900
Text Notes 3750 3000 0    50   ~ 0
A
Wire Wire Line
	3650 2900 3600 3000
Wire Wire Line
	5700 2550 5700 2650
Wire Wire Line
	6000 2700 6000 2800
Wire Wire Line
	7500 2650 7500 2550
Wire Wire Line
	6000 2800 7200 2800
Wire Wire Line
	7200 2800 7200 2700
Wire Wire Line
	5700 2650 7500 2650
Text Notes 6750 2500 0    50   ~ 0
D
Wire Wire Line
	5450 2400 5750 2400
Wire Wire Line
	5750 2500 5450 2500
Wire Wire Line
	5450 2500 5400 2400
Wire Wire Line
	5750 2400 5800 2500
Wire Wire Line
	5750 2500 5800 2400
Text Notes 5550 2500 0    50   ~ 0
A
Wire Wire Line
	5450 2400 5400 2500
Wire Wire Line
	4800 2700 6000 2700
Wire Wire Line
	5100 2550 5700 2550
Wire Wire Line
	3400 2500 5400 2500
Wire Wire Line
	3400 2400 5400 2400
Wire Wire Line
	6300 3050 6300 3150
Wire Wire Line
	6600 3200 6600 3300
Wire Wire Line
	8100 3150 8100 3050
Wire Wire Line
	6600 3300 7800 3300
Wire Wire Line
	7800 3300 7800 3200
Wire Wire Line
	6300 3150 8100 3150
Text Notes 7350 3000 0    50   ~ 0
D
Wire Wire Line
	6050 2900 6350 2900
Wire Wire Line
	6350 3000 6050 3000
Wire Wire Line
	6050 3000 6000 2900
Wire Wire Line
	6350 2900 6400 3000
Wire Wire Line
	6350 3000 6400 2900
Text Notes 6150 3000 0    50   ~ 0
A
Wire Wire Line
	6050 2900 6000 3000
Wire Wire Line
	5400 3200 6600 3200
Wire Wire Line
	5700 3050 6300 3050
Wire Wire Line
	4000 3000 6000 3000
Wire Wire Line
	4000 2900 6000 2900
Wire Wire Line
	2200 1900 4200 1900
Wire Wire Line
	2200 2000 4200 2000
Wire Wire Line
	3900 2050 4500 2050
Wire Wire Line
	3600 2200 4800 2200
Wire Wire Line
	4250 1900 4200 2000
Text Notes 4350 2000 0    50   ~ 0
A
Wire Wire Line
	4550 2000 4600 1900
Wire Wire Line
	4550 1900 4600 2000
Wire Wire Line
	4250 2000 4200 1900
Wire Wire Line
	4550 2000 4250 2000
Wire Wire Line
	4250 1900 4550 1900
Text Notes 5550 2000 0    50   ~ 0
D
Wire Wire Line
	4500 2150 6300 2150
Wire Wire Line
	6000 2300 6000 2200
Wire Wire Line
	4800 2300 6000 2300
Wire Wire Line
	6300 2150 6300 2050
Wire Wire Line
	4800 2200 4800 2300
Wire Wire Line
	4500 2050 4500 2150
Wire Wire Line
	1850 1900 1800 2000
Text Notes 1950 2000 0    50   ~ 0
A
Wire Wire Line
	2150 2000 2200 1900
Wire Wire Line
	2150 1900 2200 2000
Wire Wire Line
	1850 2000 1800 1900
Wire Wire Line
	2150 2000 1850 2000
Wire Wire Line
	1850 1900 2150 1900
Text Notes 3150 2000 0    50   ~ 0
D
Wire Wire Line
	2100 2150 3900 2150
Wire Wire Line
	3600 2300 3600 2200
Wire Wire Line
	2400 2300 3600 2300
Wire Wire Line
	3900 2150 3900 2050
Wire Wire Line
	2400 2200 2400 2300
Wire Wire Line
	2100 2050 2100 2150
Text Notes 1600 2150 2    50   ~ 0
RALE
Text Notes 1600 1850 2    50   ~ 0
RClk
Wire Wire Line
	8650 1750 8650 1850
Wire Wire Line
	8350 1750 8650 1750
Wire Wire Line
	8350 1850 8350 1750
Wire Wire Line
	8050 1850 8350 1850
Wire Wire Line
	7750 1850 7750 1750
Wire Wire Line
	7450 1850 7750 1850
Wire Wire Line
	7450 1750 7450 1850
Wire Wire Line
	7150 1750 7450 1750
Wire Wire Line
	7150 1850 7150 1750
Wire Wire Line
	6850 1850 7150 1850
Wire Wire Line
	6850 1750 6850 1850
Wire Wire Line
	8050 1750 8050 1850
Wire Wire Line
	7750 1750 8050 1750
Wire Wire Line
	6550 1750 6850 1750
Wire Wire Line
	6550 1850 6550 1750
Wire Wire Line
	6250 1850 6550 1850
Wire Wire Line
	6250 1750 6250 1850
Wire Wire Line
	5950 1750 6250 1750
Wire Wire Line
	5950 1850 5950 1750
Wire Wire Line
	5650 1850 5950 1850
Wire Wire Line
	5650 1750 5650 1850
Wire Wire Line
	5350 1750 5650 1750
Wire Wire Line
	5350 1850 5350 1750
Wire Wire Line
	5050 1850 5350 1850
Wire Wire Line
	5050 1750 5050 1850
Wire Wire Line
	4750 1750 5050 1750
Wire Wire Line
	4750 1850 4750 1750
Wire Wire Line
	4450 1850 4750 1850
Wire Wire Line
	4450 1750 4450 1850
Wire Wire Line
	4150 1750 4450 1750
Wire Wire Line
	4150 1850 4150 1750
Wire Wire Line
	3850 1850 4150 1850
Wire Wire Line
	3550 1850 3550 1750
Wire Wire Line
	3250 1850 3550 1850
Wire Wire Line
	3250 1750 3250 1850
Wire Wire Line
	2950 1750 3250 1750
Wire Wire Line
	2950 1850 2950 1750
Wire Wire Line
	2650 1850 2950 1850
Wire Wire Line
	2650 1750 2650 1850
Wire Wire Line
	2350 1750 2650 1750
Wire Wire Line
	2350 1850 2350 1750
Wire Wire Line
	3850 1750 3850 1850
Wire Wire Line
	2050 1850 2050 1750
Wire Wire Line
	2050 1850 2350 1850
Wire Wire Line
	3550 1750 3850 1750
Wire Wire Line
	8650 1450 8650 1550
Wire Wire Line
	7750 1550 8650 1550
Wire Wire Line
	7750 1450 7750 1550
Wire Wire Line
	7750 1450 6550 1450
Wire Wire Line
	6550 1450 6550 1550
Text Notes 7100 1650 0    40   ~ 0
Disallow CS,OE,WE
Wire Wire Line
	6550 1550 5650 1550
Wire Wire Line
	4450 1450 5650 1450
Wire Wire Line
	3550 1550 4450 1550
Wire Wire Line
	4450 1450 4450 1550
Wire Wire Line
	5650 1450 5650 1550
Text Notes 1600 1550 2    50   ~ 0
Q3
Wire Wire Line
	3550 1450 3550 1550
Wire Wire Line
	3550 1450 2350 1450
Wire Wire Line
	2350 1450 2350 1550
Text Notes 6500 1650 0    40   ~ 0
Latch WR data
Text Notes 5300 1650 0    40   ~ 0
Allow CS,OE,WE
Text Notes 2900 1650 0    40   ~ 0
Disallow CS,OE,WE
Text Notes 4700 1650 0    40   ~ 0
Latch addr. attr.\nSwitch 2k IO ROM
Text Notes 2300 1650 0    40   ~ 0
Latch WR data
Wire Bus Line
	4400 1650 4400 950 
Wire Bus Line
	8600 1650 8600 950 
Text Notes 6150 5200 0    50   ~ 0
Apple II Registers:\n  C0XF: ROM bank\n  C0XB: Vblank (high bit set if blanking, cleared o.w.)\n  C0XA: Read current video byte\n  C0X1: Argument/result register\n  C0X0: Command/Status register\n\nAVR Registers:\n  X1: Argument/result register\n  X0: Command/Status register (done, rx, 111111)\n\nMouse Entry Vector Table:\n  19: INITMOUSE: Reset mouse clamps, position\n  18: HOMEMOUSE: Set mouse to top-left of camp\n  17: CLAMPMOUSE: Bound mouse in a window\n  16: POSMOUSE: Set mouse position\n  15: CLEARMOUSE: Clear mouse position to 0\n  14: READMOUSE Read mouse position\n  13: SERVEMOUSE Service mouse interrupt\n  12: SETMOUSE Set mouse mode
Text Notes 3650 5200 0    50   ~ 0
R~CS~ = ~CSEN & (IOSEL | (IOSTRB & IOROMEN))~\nR~OE~ = ~R~W\n\nROMA[15:12] = Bank[4:1]\nROMA[11] = IOSEL ? 0 : Bank[0]\nD[7:0] = (~DEVSEL~ | ~CSEN~ | ~R~W | AVidSEL) ? 8’bZ :\n          ACmdStatusSEL ? {CmdDone, CmdRX, ArgRX, 5’h1F} :\n          AArgResSEL ? ArgRes[7:0] :\n          AVBlSEL ? (VBl ? 0x80 : 0x00)\n\nRAD[7:0] = ~RRD~ ? 8’bZ : RDR[7:0]\nRAR[7:0] = RAD[7:0] @ ALE\nRDR[7:0] = (RCmdStatSEL & ~S3~ & ~RDRSet~) ? Cmd[7:0] :\n            (RArgResSEL & ~S3~ & ~RDRSet~) ? ArgRes[7:0]\nRDRSet = ~ALE~ ? 0 : ~S3~ ? 1 : RDRSet\n
Text Notes 8250 5950 0    50   ~ 0
Commands to AVR:\n  FF: SW_RESET\n\n  E3: GET_IRQSTATE\n  E2: SET_MODE\n  E1: INIT_VBL\n  E0: INIT_MOUSE\n\n  C1: GO_CLEAR (pos)\n  C0: GO_HOME (pos)\n\n  83: SET_HI\n  82: SET_LO\n  81: GET_HI\n  80: GET_LO\n\n  53: SET_Y0 (clamp)\n  52: SET_Y1 (clamp)\n  51: SET_X0 (clamp)\n  50: SET_X1 (clamp)\n  41: SET_Y (pos)\n  40: SET_X (pos)\n\n  13: GET_Y0 (clamp)\n  12: GET_Y1 (clamp)\n  11: GET_X0 (clamp)\n  10: GET_X1 (clamp)\n  01: GET_Y (pos)\n  00: GET_X (pos)
$EndSCHEMATC
