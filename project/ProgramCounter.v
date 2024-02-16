module ProgramCounter(done, clk, rst, en, addr, outAddr);
	
	//done: call PC to add 1
	//clk, rst signal
	//en: call PC to rewind
	input done, clk, rst, en;
	
	//addr - cached addr
	input [15:0] addr;
	//outAddr - current addr
	output [15:0] outAddr;
	
	//reg for PC
	reg [15:0] addrTemp;
	
	always @(posedge clk or posedge rst) begin
		if (rst)
			addrTemp <= 0;
		else if (done)
			addrTemp <= addrTemp + 1;
		else if (en)
			addrTemp <= addr;
	end
	
	assign outAddr = addrTemp;

endmodule