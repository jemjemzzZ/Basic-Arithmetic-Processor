module Reg(D, clk, rst, enable, Q);
	input [15:0] D;
	input clk, rst, enable;
	output reg[15:0] Q;
	
	always @ (posedge clk or posedge rst) begin
		//reset
		if (rst)
			Q <= 0;
		else if (enable)
			Q <= D;
			
	end
	
endmodule