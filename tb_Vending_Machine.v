`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 10:35:29 PM
// Design Name: 
// Module Name: tb_Vending_Machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Vending_Machine();
	reg clk,rst;
	reg [1:0] coin_in;
	wire product_out;
	
Vending_Machine dut(clk,rst,coin_in,product_out);

task initialize();
	begin
		clk = 1'b0;
		rst = 1'b0;
		coin_in = 2'b0;
	end
endtask

always #10 clk = ~clk;

task reset();
	begin
		@(negedge clk)
			rst = 1'b1;
		@(negedge clk)
			rst = 1'b0;
	end
endtask

task stimulus(input [1:0] i);
	begin
		@(negedge clk)	
		coin_in = i;
	end
endtask

initial
	begin
		initialize();
		#10
		reset();
		#10
		stimulus(2'b01);
		#10
		stimulus(2'b10);
		#10
		stimulus(2'b11);
		
		
	end
endmodule
