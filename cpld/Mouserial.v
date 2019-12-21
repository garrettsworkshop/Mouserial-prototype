module Mouserial(C7M, Q3, PHI0in, nRES,
			 A, D, nWE, nINH, nIRQ,
			 ROMA, nROE, nRCS,
			 nDEVSEL, nIOSEL, nIOSTRB,
			 Rclk, nRRST, nRIRQ, nKMode,
			 RAD, nRALE, nRRD, nRWR,
			 nSS, SCK, MISO, MOSI,
			 T0, Vbl0, Vbl1);

	/* Apple II Clock, Reset */
	input C7M, Q3, PHI0in; // Clock inputs
	input nRES; // Reset
	wire AIRQ = Vbl0 & ~Vbl1 & AIRQEN;
	output nIRQ = AIRQ ? 1'b0 : 1'bZ;

	/* PHI1 Delay */  
	wire [8:0] PHI1b;
	wire PHI1;
	LCELL PHI1b0_MC (.in(~PHI0in), .out(PHI1b[0]));
	LCELL PHI1b1_MC (.in(PHI1b[0]), .out(PHI1b[1]));
	LCELL PHI1b2_MC (.in(PHI1b[1]), .out(PHI1b[2]));
	LCELL PHI1b3_MC (.in(PHI1b[2]), .out(PHI1b[3]));
	LCELL PHI1b4_MC (.in(PHI1b[3]), .out(PHI1b[4]));
	LCELL PHI1b5_MC (.in(PHI1b[4]), .out(PHI1b[5]));
	LCELL PHI1b6_MC (.in(PHI1b[5]), .out(PHI1b[6]));
	LCELL PHI1b7_MC (.in(PHI1b[6]), .out(PHI1b[7]));
	LCELL PHI1b8_MC (.in(PHI1b[7]), .out(PHI1b[8]));
	LCELL PHI1b9_MC (.in(PHI1b[8] & ~PHI0in), .out(PHI1));

	/* Address Bus, etc. */
	input nDEVSEL, nIOSEL, nIOSTRB; // Card select signals
	input [15:0] A; // 6502 address bus
	input nWE; // 6502 R/W
	output [15:11] ROMA = ~nIOSTRB ? Bank+1 : 5'h00;

	/* 6502 Select Signals */
	wire ABankSELA = A[3:0]==4'hF; wire ABankWR;
	LCELL ABankWR_MC (.in(ABankSELA & ~nWE & ~nDEVSEL & S==5), .out(ABankWR));
	wire ADataHSELA = A[3:0]==4'h3; wire ADataHWR;
	LCELL ADataHWR_MC (.in(ADataHSELA & ~nWE & ~nDEVSEL & S==5), .out(ADataHWR));
	wire ADataLSELA = A[3:0]==4'h2; wire ADataLWR;
	LCELL ADataLWR_MC (.in(ADataLSELA & ~nWE & ~nDEVSEL & S==5), .out(ADataLWR));
	wire ACmdSELA = A[3:0]==4'h1; wire ACmdWR;
	LCELL ACmdWR_MC (.in(ACmdSELA & ~nWE & ~nDEVSEL & S==5), .out(ACmdWR));
	wire AStatSELA = A[3:0]==4'h0; wire AStatWR;
	LCELL AStatWR_MC (.in(AStatSELA & ~nWE & ~nDEVSEL & S==5), .out(AStatWR));
	
	/* AKeySEL signal true when should assert nINH and drive Key[7:0] */
	wire AKeySEL;
	LCELL AKeySEL_MC (.in(A[15:4]==12'hC00 & nWE & ~nKMode), .out(AKeySEL));
	output nINH = AKeySEL ? 1'b0 : 1'bZ; // Inhibit keyboard data

	/* 6502 Bus */
	wire DOE = nRES & nWE & ((~nDEVSEL & CSDBEN) | (AKeySEL & PHI0in));
	reg [7:0] Dout;
	inout [7:0] D = DOE ? Dout : 8'bZ;
	
	/* ROM control signals & bank register */
	output nROE = ~nWE;
	output nRCS = ~((~nIOSEL | (~nIOSTRB & IOROMEN)) & CSDBEN);
	reg [4:0] Bank = 5'h00; // Bank register for ROM access

	/* AVR Clock, Reset */
	output Rclk = C7M; // Buffer 7 MHz clock to AVR
	reg nRRSTreg = 0;
	inout nRRST = nRRSTreg ? 1'b0 : 1'bZ; // AVR reset
	
	// AVR IRQ
	reg PendRIRQEN;
	reg ResetRIRQEN;
	output nRIRQ = ~((CmdPending & PendRIRQEN) | (~nRES & ResetRIRQEN));
	
	/* AVR Select Signals */
	wire RKeySELA = RAreg[3:0]==4'h4; wire RKeyWR;
	LCELL RKeyWR_MC (.in(RKeySELA & ~nRWR), .out(RKeyWR));
	wire RDataHSELA = RAreg[3:0]==4'h3; wire RDataHWR;
	LCELL RDataHWR_MC (.in(RDataHSELA & ~nRWR), .out(RDataHWR));
	wire RDataLSELA = RAreg[3:0]==4'h2; wire RDataLWR;
	LCELL RDataLWR_MC (.in(RDataLSELA & ~nRWR), .out(RDataLWR));
	wire RCmdSELA = RAreg[3:0]==4'h1; wire RCmdWR;
	LCELL RCmdWR_MC (.in(RStatusSELA & ~nRRD), .out(RCmdWR));
	wire RStatusSELA = RAreg[3:0]==4'h0; wire RStatusWR;
	LCELL RStatusWR_MC (.in(RStatusSELA & ~nRWR), .out(RStatusWR));

	/* AVR Bus */
	input nRALE, nRRD, nRWR;
	reg [7:0] RDout;
	inout [7:0] RAD = nRRD ? 8'bZ : RDout[7:0];
	reg [3:0] RAreg;
	
	/* AVR SPI */
	input nSS, SCK, MISO, MOSI;
	
	/* AVR Timer */
	input Vbl0, Vbl1;
	reg Vbl0reg;
	output T0 = Q3;

	/* State */
	reg [2:0] S = 2'b00; // State counter
	reg PHI1reg = 1'b0; // Saved PHI1 at last rising clock edge
	reg PHI0seen = 1'b0; // Have we seen PHI0 since reset?
	reg CSDBEN = 0; // ROM CS, data bus driver gating
	reg IOROMEN = 1'b0; // IOSTRB ROM enable
	reg AIRQEN = 1'b0; // Enable this to assert IRQ to 6502
	input nKMode; // Keyboard inhibit jumper
	
	/* Shared Registers and State */
	reg [15:0] Data;
	reg [6:0] Cmd = 7'h00;
	reg [7:0] Key = 8'h00;
	reg CmdPending = 1'b0;

	// Apple II Bus Compatibiltiy Rules:
	// Synchronize to PHI0 or PHI1. (PHI1 here)
	// PHI1's edge may be -20ns,+10ns relative to C7M.
	// Delay the rising edge of PHI1 to get enough hold time:
	// 		PHI1modified = PHI1 & PHI1delayed;
	// Only sample /DEVSEL, /IOSEL at these times:
	// 		2nd and 3rd rising edge of C7M in PHI0 (S4, S5)
	//		all 3 falling edges of C7M in PHI0 (S4, S5, S6)
	// Can sample /IOSTRB at same times as /IOSEL, plus:
	//		1st rising edge of C7M in PHI0 (S3)

	always @(posedge C7M, negedge nRES) begin
		if (~nRES) begin // Reset
			PHI1reg <= 1'b0;
			PHI0seen <= 1'b0;
			S <= 3'h0;
			IOROMEN <= 1'b0;
			CSDBEN <= 1'b0;
			Bank[4:0] <= 5'h0;
			Key[7:0] <= 8'h00;
			Cmd[6:0] <= 7'h00;
			CmdPending <= 1'b0;
			AIRQEN <= 1'b0;
			nRRSTreg <= 1'b0;
		end else begin
			// Synchronize state counter to S1 when just entering PHI1
			PHI1reg <= PHI1; // Save old PHI1
			if (~PHI1) PHI0seen <= 1; // PHI0seen set in PHI0
			S <= (PHI1 & ~PHI1reg & PHI0seen) ? 4'h1 : 
				S==0 ? 3'h0 :
				S==7 ? 3'h7 : S+1;

			// Disable IOSTRB ROM when accessing 0xCFFF.
			if (S==3 & ~nIOSTRB & A[10:0]==11'h7FF) IOROMEN <= 1'b0;

			// Enable IOSTRB ROM when accessing CnXX in IOSEL ROM.
			if (S==4 & ~nIOSEL) IOROMEN <= 1'b1;

			// Only drive Apple II data bus after state 4 to avoid bus fight.
			// Thus we wait 1.5 7M cycles (210 ns) into PHI0 before driving.
			// Same for driving the ROM/SRAM data bus (RD).
			// Similarly, only select the ROM chip starting at the end of S4.
			// This provides address setup time for write operations and 
			// minimizes power consumption.
			CSDBEN <= S==4 | S==5 | S==6 | S==7;

			// Latch video data in S2, near the end of PHI1.
			// This is kept when 6502 reads the status register.
			if (S==2) Dout[6] <= D[7];

			// Register 6502 read data in S4
			if (S==4) Dout <= AKeySEL ? Key[7:0] :
				ADataHSELA ? Data[15:8] : 
				ADataLSELA ? Data[7:0] : 
				AStatSELA ? { CmdPending, Dout[6], Vbl0, 5'h00 } : 8'h00;

			// 6502 write non-shared registers
			if (ABankWR) Bank[4:0] <= D[4:0];
			if (AStatWR) begin
				AIRQEN <= D[1];
				nRRSTreg <= D[0];
			end

			// Register AVR read data when not reading
			if (nRRD) RDout[7:0] <=
				RCmdSELA ? {~nRES, Cmd[6:0]} : 
				RDataHSELA ? Data[15:8] :
				RDataLSELA ? Data[7:0] : 8'h00;
			
			// AVR write non-shared registers
			if (RStatusWR) begin
				PendRIRQEN <= RAD[1];
				ResetRIRQEN <=RAD[0];
			end

			// AVR write key register
			if (RKeyWR) Key[7:0] <= RAD[7:0];

			// Write shared data hi register.
			// AVR has priority if simultaneous write
			if (RDataHWR) Data[15:8] <= RAD[7:0];
			else if (ADataHWR) Data[15:8] <= D[7:0];

			// Write shared data lo register.
			// AVR has priority if simultaneous write
			if (RDataLWR) Data[7:0] <= RAD[7:0];
			else if (ADataLWR) Data[7:0] <= D[7:0];

			// Submit & clear command.
			// 6502 submits command and sets pending.
			// AVR clears command and pending by writing.
			// Command submission has precedence over clear pending.
			if (ACmdWR) begin
				Cmd[6:0] <= D[6:0]; // Set command code
				CmdPending <= 1'b1; // Submit command
			end else if (RCmdWR) begin
				Cmd[6:0] <= 7'h00; // Clear command
				CmdPending <= 1'b0; // Command done
			end
		end
	end
	
	// Latch AVR address on nRALE falling edge
	always @(negedge nRALE) begin
		RAreg[3:0] <= RAD[3:0];
	end
endmodule
