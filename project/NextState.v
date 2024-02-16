module NextState(state, fncode, next, count);
	
	//current state
	input [4:0] state;
	//instruction
	input [15:0] fncode;
	
	//current count
	input [3:0] count;
	
	//next state
	output reg [15:0] next;
	
	always @(state, fncode) begin
		case (state)
		//initial state
		5'b00000: begin
			//load
			if (fncode[15:12] == 4'b0000)
				next <= 5'b00001;
			//move
			else if (fncode[15:12] == 4'b0001)
				next <= 5'b00010;
			//ldpc
			else if (fncode[15:12] == 4'b0010)
				next <= 5'b00011;
			//branch
			else if (fncode[15:12] == 4'b0011)
				next <= 5'b00100;
			//add
			else if (fncode[15:12] == 4'b0100)
				next <= 5'b00101;
			//xor
			else if (fncode[15:12] == 4'b0101)
				next <= 5'b01000;
			//sub
			else if (fncode[15:12] == 4'b0110)
				next <= 5'b01011;
			//mul
			else if (fncode[15:12] == 4'b0111)
				next <= 5'b01110;
			//div
			else if (fncode[15:12] == 4'b1000)
				next <= 5'b10001;
			//***********FINAL EXAM***********
			//ones
			else if (fncode[15:12] == 4'b1001)
				next <= 5'b10100;
			//onesAll
			else if (fncode[15:12] == 4'b1010)
				next <= 5'b10111;
		end
		//load
		5'b00001: begin next <= 5'b00000; end
		//move
		5'b00010: begin next <= 5'b00000; end
		//ldpc
		5'b00011: begin next <= 5'b00000; end
		//branch
		5'b00100: begin next <= 5'b00000; end
		//add
		5'b00101: begin next <= 5'b00110; end
		//add2
		5'b00110: begin next <= 5'b00111; end
		//add3
		5'b00111: begin next <= 5'b00000; end
		//xor
		5'b01000: begin next <= 5'b01001; end
		//xor2
		5'b01001: begin next <= 5'b01010; end
		//xor3
		5'b01010: begin next <= 5'b00000; end
		//sub
		5'b01011: begin next <= 5'b01100; end
		//sub2
		5'b01100: begin next <= 5'b01101; end
		//sub3
		5'b01101: begin next <= 5'b00000; end
		//mul
		5'b01110: begin next <= 5'b01111; end
		//mul2
		5'b01111: begin next <= 5'b10000; end
		//mul3
		5'b10000: begin next <= 5'b00000; end
		//div
		5'b10001: begin next <= 5'b10010; end
		//div2
		5'b10010: begin next <= 5'b10011; end
		//div3
		5'b10011: begin next <= 5'b00000; end
		//************FINAL EXAM*************
		//ones
		5'b10100: begin next <= 5'b10101; end
		//ones2
		5'b10101: begin next <= 5'b10110; end
		//ones3
		5'b10110: begin next <= 5'b00000; end
		//onesAll - r0
		5'b10111: begin next <= 5'b11000; end
		//onesAll2 - r0
		5'b11000: begin next <= 5'b11001; end
		//onesAll3
		5'b11001: begin
			if (count == 4'b0000)
				//done -> onesAll7
				next <= 5'b11101;
			else
				//continue -> onesAll4
				next <= 5'b11010;
		end
		//onesAll4
		5'b11010: begin next <= 5'b11011; end
		//onesAll5
		5'b11011: begin next <= 5'b11100; end
		//onesAll6 -> onesAll3 cycle r1-r15
		5'b11100: begin next <= 5'b11001; end
		//onesAll7 -> initial state
		5'b11101: begin next <= 5'b00000; end
		//default
		default: begin next <= 5'b00000; end
		endcase
	end

endmodule