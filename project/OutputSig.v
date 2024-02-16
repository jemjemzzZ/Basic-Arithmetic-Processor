module OutputSig(state, fncode, aen, gen, gout, sel, extern, regIndex, triIndex, done, en, readAddr, count, ctrEn);
	
	//state
	input [4:0] state;
	//instruction
	input [15:0] fncode;
	
	//control signals
	output reg aen;
	output reg gen;
	output reg gout;
	output reg [2:0] sel;
	output reg extern;
	
	//index for reg/tri to be activated
	output reg [3:0] regIndex;
	output reg [3:0] triIndex;
	
	//call program counter + 1
	output reg done;
	//call program counter to read cached addr (branch)
	output reg en;
	//call datapath to use data or addr
	output reg readAddr;
	
	//current count & ctr enable signal
	input [3:0] count;
	output reg ctrEn;
	
	always @(state, fncode) begin
		case (state)
		//initial
		5'b00000: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//load
		5'b00001: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b1; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//move
		5'b00010: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= fncode[7:4]; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//ldpc
		5'b00011: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b1; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b1; end
		//branch
		5'b00100: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b1; readAddr = 1'b0; end
		//add
		5'b00101: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//add2
		5'b00110: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b000; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[7:4]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//add3
		5'b00111: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//xor
		5'b01000: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//xor2
		5'b01001: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b001; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[7:4]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//xor3
		5'b01010: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//sub
		5'b01011: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//sub2
		5'b01100: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b010; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[7:4]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//sub3
		5'b01101: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//mul
		5'b01110: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//mul2
		5'b01111: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b011; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[7:4]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//mul3
		5'b10000: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//div
		5'b10001: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//div2
		5'b10010: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b100; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[7:4]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//div3
		5'b10011: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= fncode[11:8]; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//********************************************************************************FINAL EXAM**************************************************************************************
		//ones
		5'b10100: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//ones2
		5'b10101: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b101; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= fncode[11:8]; done = 1'b0; en = 1'b0; readAddr = 1'b0; end
		//ones3
		5'b10110: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'b0000; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; end
		//onesAll
		5'b10111: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b101; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'b0000; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//onesAll2
		5'b11000: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b1; end
		//onesAll3
		5'b11001: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b0; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//onesAll4
		5'b11010: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b0; sel <= 3'b101; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= count; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//onesAll5
		5'b11011: begin aen <= 1'b0; gen <= 1'b1; gout <= 1'b1; sel <= 3'b000; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//onesAll6
		5'b11100: begin aen <= 1'b1; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; done = 1'b0; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b1; end
		//onesAll7
		5'b11101: begin aen <= 1'b0; gen <= 1'b0; gout <= 1'b1; sel <= 3'bxxx; extern <= 1'b0; regIndex <= 4'b0000; triIndex <= 4'bxxxx; done = 1'b1; en = 1'b0; readAddr = 1'b0; ctrEn = 1'b0; end
		//default
		default: begin aen <= 1'bx; gen <= 1'bx; gout <= 1'bx; sel <= 3'bxxx; extern <= 1'bx; regIndex <= 4'bxxxx; triIndex <= 4'bxxxx; end
		endcase
	end

endmodule