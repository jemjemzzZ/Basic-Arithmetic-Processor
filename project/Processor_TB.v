`timescale 1ns / 1ps

module Processor_TB;

	
	reg [31:0] count;
	
	reg clk, rst;

	wire [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
	
	//processor
	Processor inst_processor(.clk(clk), .rst(rst), .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7), .w8(w8), .w9(w9), .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15));
	
	initial begin 
		count = 0;
		clk =1'b1;
		rst =1'b0;
	end
	
	always begin
		#50
		count=count+1;
	end
	
	always begin
		#25
		clk = 1'b0;
		#25
		clk = 1'b1;
	end
	
	always @(count) begin
		case (count)
		//rst
		0: begin rst = 1'b1; end
		//start - check ProMemory.v to see the instructions
		1: begin rst = 1'b0; end
		default: begin rst = 1'b0; end 
		endcase
	end


endmodule