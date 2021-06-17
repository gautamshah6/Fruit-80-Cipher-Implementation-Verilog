`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:46:24 10/16/2020
// Design Name:   fruit80
// Target Device:  
// Tool versions:  
// Description: 
// Verilog Test Fixture created by ISE for module: fruit80
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [0:69] iv;
	reg [0:79] k;
	reg clk;
	reg rst;

	// Outputs
	wire [0:42] lf;
	wire [0:36] nf;
	wire [0:6] count1;
	wire h;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	fruit80 uut (
		.lf(lf), 
		.nf(nf), 
		.count1(count1), 
		.iv(iv), 
		.k(k), 
		.clk(clk), 
		.rst(rst), 
		.h(h), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		clk=0;
		iv = 70'b0000001111111100000000111111110000000011111111110000000011111111000000;
		k=80'b00000000111111110000000011111111000000001111111100000000111111110000000011111111;
		rst = 1;
		#8rst=0;
	end

	initial begin
		forever #5clk<=~clk;
		//wait 100ns for global reset to finish
		#100;
	end

endmodule

