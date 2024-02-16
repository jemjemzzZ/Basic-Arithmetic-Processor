module Datapath(data, clk, rst, extern, sel, ren, rout, aen, gen, gout, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, outAddr, addr, readAddr);
	//data
	input [15:0] data;
	//clk, rst signal
	input clk, rst;
	//sel for ALU
	input [2:0] sel;
	//extern for data input tribuf
	input extern;
	//ren, rout for 16 reg/tri
	input [15:0] ren, rout;
	//rA, rG
	input aen, gen, gout;
	
	//sel for data/outAddr
	input readAddr;
	//current addr from PC
	input [15:0] outAddr;
	//cached addr
	output [15:0] addr;
	
	//input data wire
	reg [15:0] wData;
	//databus
	wire [15:0] databus;
	
	//result of ALU
	wire [15:0] aluResult;
	//value inside reg
	output [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
	//value inside rA, rG
	wire [15:0] wA, wG;
	
	
	//data mux - use data or current addr
	always @(*) begin
		if (rst)
			wData <= 0;
		else if (readAddr)
			wData <= outAddr;
		else
			wData <= data;
	end
	
	//data tri
	TriBuf inst_tri(.a(wData), .b(databus), .enable(extern));
	
	//16 Reg & Tri
	Reg r0(.D(databus), .clk(clk), .rst(rst), .enable(ren[0]), .Q(w0));
	TriBuf t0(.a(w0), .b(databus), .enable(rout[0]));
	
	Reg r1(.D(databus), .clk(clk), .rst(rst), .enable(ren[1]), .Q(w1));
	TriBuf t1(.a(w1), .b(databus), .enable(rout[1]));
	
	Reg r2(.D(databus), .clk(clk), .rst(rst), .enable(ren[2]), .Q(w2));
	TriBuf t2(.a(w2), .b(databus), .enable(rout[2]));
	
	Reg r3(.D(databus), .clk(clk), .rst(rst), .enable(ren[3]), .Q(w3));
	TriBuf t3(.a(w3), .b(databus), .enable(rout[3]));
	
	Reg r4(.D(databus), .clk(clk), .rst(rst), .enable(ren[4]), .Q(w4));
	TriBuf t4(.a(w4), .b(databus), .enable(rout[4]));
	
	Reg r5(.D(databus), .clk(clk), .rst(rst), .enable(ren[5]), .Q(w5));
	TriBuf t5(.a(w5), .b(databus), .enable(rout[5]));
	
	Reg r6(.D(databus), .clk(clk), .rst(rst), .enable(ren[6]), .Q(w6));
	TriBuf t6(.a(w6), .b(databus), .enable(rout[6]));
	
	Reg r7(.D(databus), .clk(clk), .rst(rst), .enable(ren[7]), .Q(w7));
	TriBuf t7(.a(w7), .b(databus), .enable(rout[7]));
	
	Reg r8(.D(databus), .clk(clk), .rst(rst), .enable(ren[8]), .Q(w8));
	TriBuf t8(.a(w8), .b(databus), .enable(rout[8]));
	
	Reg r9(.D(databus), .clk(clk), .rst(rst), .enable(ren[9]), .Q(w9));
	TriBuf t9(.a(w9), .b(databus), .enable(rout[9]));
	
	Reg r10(.D(databus), .clk(clk), .rst(rst), .enable(ren[10]), .Q(w10));
	TriBuf t10(.a(w10), .b(databus), .enable(rout[10]));
	
	Reg r11(.D(databus), .clk(clk), .rst(rst), .enable(ren[11]), .Q(w11));
	TriBuf t11(.a(w11), .b(databus), .enable(rout[11]));
	
	Reg r12(.D(databus), .clk(clk), .rst(rst), .enable(ren[12]), .Q(w12));
	TriBuf t12(.a(w12), .b(databus), .enable(rout[12]));
	
	Reg r13(.D(databus), .clk(clk), .rst(rst), .enable(ren[13]), .Q(w13));
	TriBuf t13(.a(w13), .b(databus), .enable(rout[13]));
	
	Reg r14(.D(databus), .clk(clk), .rst(rst), .enable(ren[14]), .Q(w14));
	TriBuf t14(.a(w14), .b(databus), .enable(rout[14]));
	
	Reg r15(.D(databus), .clk(clk), .rst(rst), .enable(ren[15]), .Q(w15));
	TriBuf t15(.a(w15), .b(databus), .enable(rout[15]));
	
	//A reg
	Reg aReg(.D(databus), .clk(clk), .rst(rst), .enable(aen), .Q(wA));
	
	//ALU
	ALU inst_alu(.sel(sel), .a(wA), .b(databus), .aluResult(aluResult));
	
	//G Reg & Tri
	Reg rG(.D(aluResult), .clk(clk), .rst(rst), .enable(gen), .Q(wG));
	TriBuf tG(.a(wG), .b(databus), .enable(gout));
	
	//output cached addr
	assign addr = databus;
	
endmodule