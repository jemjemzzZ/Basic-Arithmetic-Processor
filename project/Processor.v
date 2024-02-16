module Processor(clk, rst, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15);

	input clk, rst;
	
	output [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
	
	wire [15:0] ren, rout;
	wire [2:0] sel;
	wire aen, gen, gout, extern;
	
	wire [15:0] fncode;
	wire [15:0] data;
	
	wire done, en;
	
	wire readAddr;
	
	wire [15:0] addr, outAddr;
	
	//fsm
	FSM inst_a(.fncode(fncode), .clk(clk), .rst(rst), .ren(ren), .rout(rout), .aen(aen), .gen(gen), .gout(gout), .sel(sel), .extern(extern), .done(done), .en(en), .readAddr(readAddr));
	
	//datapath
	Datapath inst_b(.data(data), .clk(clk), .rst(rst), .extern(extern), .sel(sel), .ren(ren), .rout(rout), .aen(aen), .gen(gen), .gout(gout), .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7), .w8(w8), .w9(w9), .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15), .outAddr(outAddr), .addr(addr), .readAddr(readAddr));
	
	
	//program counter
	ProgramCounter inst_pc(.done(done), .clk(clk), .rst(rst), .en(en), .addr(addr), .outAddr(outAddr));
	
	//memory
	ProMemory inst_memory(.clk(clk), .addr(outAddr), .fncode(fncode), .data(data));
	
endmodule