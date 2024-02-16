module ProMemory(clk, addr, fncode, data);
	
	input clk;
	
	input [15:0] addr;
	
	output reg [15:0] fncode;
	output reg [15:0] data;
	
	always @(addr) begin
		case (addr)
		//load r0 1
		0: begin fncode = 16'b0000000000000000; data = 16'b0000000000000001; end
		//move r1 r0
		1: begin fncode = 16'b0001000100000000; data = 16'b0000000000000000; end
		//add r0 r1
		2: begin fncode = 16'b0100000000010000; data = 16'b0000000000000000; end
		//add r0 r1
		3: begin fncode = 16'b0100000000010000; data = 16'b0000000000000000; end
		//add r0 r1
		4: begin fncode = 16'b0100000000010000; data = 16'b0000000000000000; end
		//load r2 2
		5: begin fncode = 16'b0000001000000000; data = 16'b0000000000000010; end
		//add r0 r2
		6: begin fncode = 16'b0100000000100000; data = 16'b0000000000000000; end
		//load r3 8
		7: begin fncode = 16'b0000001100000000; data = 16'b0000000000001000; end
		//move r4 r3
		8: begin fncode = 16'b0001010000110000; data = 16'b0000000000000000; end
		//xor r1 r4
		9: begin fncode = 16'b0101000101000000; data = 16'b0000000000000000; end
		//sub r4 r0
		10: begin fncode = 16'b0110010000000000; data = 16'b0000000000000000; end
		//mul r4 r1
		11: begin fncode = 16'b0111010000010000; data = 16'b0000000000000000; end
		//div r4 r0
		12: begin fncode = 16'b1000010000000000; data = 16'b0000000000000000; end
		//move r5 r4
		13: begin fncode = 16'b0001010101000000; data = 16'b0000000000000000; end
		
		//************************FINAL EXAM MODIFICATION************************
		//ones r5
		14: begin fncode = 16'b1001010100000000; data = 16'b0000000000000000; end
		//load r6 16 1s
		15: begin fncode = 16'b0000011000000000; data = 16'b1111111111111111; end
		//ones r6
		16: begin fncode = 16'b1001011000000000; data = 16'b0000000000000000; end
		//onesAll
		17: begin fncode = 16'b1010000000000000; data = 16'b0000000000000000; end
		//move r7 r0
		18: begin fncode = 16'b0001011100000000; data = 16'b0000000000000000; end
		//onesAll
		19: begin fncode = 16'b1010000000000000; data = 16'b0000000000000000; end
		//onesAll
		20: begin fncode = 16'b1010000000000000; data = 16'b0000000000000000; end
		//ones r0
		21: begin fncode = 16'b1001000000000000; data = 16'b0000000000000000; end
		//move r6 r0
		22: begin fncode = 16'b0001011000000000; data = 16'b0000000000000000; end
		//load r8 0
		23: begin fncode = 16'b0000100000000000; data = 16'b0000000000000000; end
		//ones r8
		24: begin fncode = 16'b1001100000000000; data = 16'b0000000000000000; end
		
		//*******************Old TestBench for Assignment Use********************
//		//fibonacci sequence
//		//load r0 0
//		14: begin fncode = 16'b0000000000000000; data = 16'b0000000000000000; end
//		//load r1 1
//		15: begin fncode = 16'b0000000100000000; data = 16'b0000000000000001; end
//		//load r2 0
//		16: begin fncode = 16'b0000001000000000; data = 16'b0000000000000000; end
//		//ldpc r15
//		17: begin fncode = 16'b0010111100000000; data = 16'b0000000000000000; end
//		//move r3 r1
//		18: begin fncode = 16'b0001001100010000; data = 16'b0000000000000000; end
//		//add r1 r2
//		19: begin fncode = 16'b0100000100100000; data = 16'b0000000000000000; end
//		//move r0 r1
//		20: begin fncode = 16'b0001000000010000; data = 16'b0000000000000000; end
//		//move r2 r3
//		21: begin fncode = 16'b0001001000110000; data = 16'b0000000000000000; end
//		//move r1 r0
//		22: begin fncode = 16'b0001000100000000; data = 16'b0000000000000000; end
//		//branch r15
//		23: begin fncode = 16'b0011111100000000; data = 16'b0000000000000000; end


		endcase
	end
	
endmodule