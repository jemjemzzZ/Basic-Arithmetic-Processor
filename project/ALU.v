module ALU(sel, a, b, aluResult);
	
	//selection
	input [2:0] sel;
	//rx ry
	input [15:0] a, b;
	//result
	output reg [15:0] aluResult;
	
	always @ (sel, a, b) begin
		if (sel == 3'b000)
			//add
			aluResult = a + b;
		else if (sel == 3'b001)
			//xor
			aluResult = a ^ b;
		else if (sel == 3'b010)
			//sub
			aluResult = a - b;
		else if (sel == 3'b011) 
			//multiply
			aluResult = a * b;
		else if (sel == 3'b100)
			//divide
			aluResult = a / b;
		//*****FINAL EXAM******
		else if (sel == 3'b101)
			//ones
			aluResult = b[0] + b[1] + b[2] + b[3] + b[4] + b[5] + b[6] + b[7] + b[8] + b[9] + b[10] + b[11] + b[12] + b[13] + b[14] + b[15];
	end
	
endmodule