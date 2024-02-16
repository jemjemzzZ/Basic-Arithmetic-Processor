module Decoder(regIndex, triIndex, ren, rout);
	
	//index of reg/tri to be activated
	input [3:0] regIndex, triIndex;
	
	//reg control signals
	output reg [15:0] ren;
	//tri control signals
	output reg [15:0] rout;
	
	always @(regIndex) begin
		case(regIndex)
		4'b0000: begin ren <= 16'b0000000000000001; end
		4'b0001: begin ren <= 16'b0000000000000010; end
		4'b0010: begin ren <= 16'b0000000000000100; end
		4'b0011: begin ren <= 16'b0000000000001000; end
		4'b0100: begin ren <= 16'b0000000000010000; end
		4'b0101: begin ren <= 16'b0000000000100000; end
		4'b0110: begin ren <= 16'b0000000001000000; end
		4'b0111: begin ren <= 16'b0000000010000000; end
		4'b1000: begin ren <= 16'b0000000100000000; end
		4'b1001: begin ren <= 16'b0000001000000000; end
		4'b1010: begin ren <= 16'b0000010000000000; end
		4'b1011: begin ren <= 16'b0000100000000000; end
		4'b1100: begin ren <= 16'b0001000000000000; end
		4'b1101: begin ren <= 16'b0010000000000000; end
		4'b1110: begin ren <= 16'b0100000000000000; end
		4'b1111: begin ren <= 16'b1000000000000000; end
		default: begin ren <= 16'b0000000000000000; end
		endcase
	end
	
	always @(triIndex) begin
		case(triIndex)
		4'b0000: begin rout <= 16'b0000000000000001; end
		4'b0001: begin rout <= 16'b0000000000000010; end
		4'b0010: begin rout <= 16'b0000000000000100; end
		4'b0011: begin rout <= 16'b0000000000001000; end
		4'b0100: begin rout <= 16'b0000000000010000; end
		4'b0101: begin rout <= 16'b0000000000100000; end
		4'b0110: begin rout <= 16'b0000000001000000; end
		4'b0111: begin rout <= 16'b0000000010000000; end
		4'b1000: begin rout <= 16'b0000000100000000; end
		4'b1001: begin rout <= 16'b0000001000000000; end
		4'b1010: begin rout <= 16'b0000010000000000; end
		4'b1011: begin rout <= 16'b0000100000000000; end
		4'b1100: begin rout <= 16'b0001000000000000; end
		4'b1101: begin rout <= 16'b0010000000000000; end
		4'b1110: begin rout <= 16'b0100000000000000; end
		4'b1111: begin rout <= 16'b1000000000000000; end
		default: begin rout <= 16'b0000000000000000; end
		endcase
	end

endmodule

