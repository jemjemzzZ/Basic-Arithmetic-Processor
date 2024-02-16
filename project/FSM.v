//state count for ONESALL
//***********FINAL EXAM MODIFICATION***********
module Counter(clk, rst, ctrEn, count);
	//clk, rst
	input clk, rst;
	
	//enable signal for count to increment
	input ctrEn;
	
	//count
	reg [3:0] ctrTemp;
	
	//ouput current state
	output [3:0] count;
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1)
			//rst
			ctrTemp <= 0;
		else if (ctrEn == 1'b1)
			//increment
			ctrTemp <= ctrTemp + 1;
	end
	
	//output
	assign count = ctrTemp;
	
endmodule




//state register
module StateReg(D, clk, rst, Q);
	//curr
	input [4:0] D;
	//clk, rst
	input clk, rst;
	//next
	output reg[4:0] Q;
	
	always @ (posedge clk or posedge rst) begin
		if (rst == 1'b1)
			Q <= 5'b00000;
		else
			Q <= D;
	end

endmodule




//FSM
module FSM(fncode, clk, rst, ren, rout, aen, gen, gout, sel, extern, done, en, readAddr);
	//instruction
	input [15:0] fncode;
	
	//clk, rst signals
	input clk, rst;
	
	//control signals for 16 reg/tri
	output [15:0] ren, rout;
	//control signals for rA, rG
	output aen, gen, gout;
	//selection for ALU
	output [2:0] sel;
	//extern for data tri (databus)
	output extern;
	
	//done - program counter + 1
	//en - program counter rewind
	output done, en;
	
	//databus uses data or current address
	output readAddr;
	
	//current, next state
	wire [4:0] curr, next;
	//index for reg/tri to be activated
	wire [3:0] regIndex, triIndex;
	
	//counter
	wire ctrEn;
	wire [3:0] count;
	
	//my counter
	Counter inst_ctr(.clk(clk), .rst(rst), .ctrEn(ctrEn), .count(count));
	
	//next state - current instruction
	NextState inst_next(.state(curr), .fncode(fncode), .next(next), .count(count));
	
	//output sig
	OutputSig inst_sig(.state(next), .fncode(fncode), .aen(aen), .gen(gen), .gout(gout), .sel(sel), .extern(extern), 
	.regIndex(regIndex), .triIndex(triIndex), .done(done), .en(en), .readAddr(readAddr), .count(count), .ctrEn(ctrEn));
	
	//reg decoder
	Decoder inst_decoder(.regIndex(regIndex), .triIndex(triIndex), .ren(ren), .rout(rout));
	
	//state reg
	StateReg inst_sr(.D(next), .clk(clk), .rst(rst), .Q(curr));
	
endmodule