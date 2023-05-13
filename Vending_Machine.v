`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 09:42:38 PM
// Design Name: 
// Module Name: Vending_Machine
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


module Vending_Machine(clk,rst,coin_in,product_out);

	input clk;
	input rst;
	input  [1:0] coin_in;
	output  product_out;
	
	parameter idle =2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	parameter s3 = 2'b11;
	
	parameter rupee_0 = 2'b00;
	parameter rupee_1 = 2'b01;
	parameter rupee_2 = 2'b10;
	
	
	reg [1:0] present_state, next_state;


    always@(posedge clk)
	begin
			if(rst)
				present_state = idle;
			else
				present_state = next_state;
	end

always@(coin_in ,present_state)
		begin	
		next_state = idle;
			case(present_state)
			
			idle:
				if(coin_in == rupee_0)
					next_state = idle;
					
				else if(coin_in == rupee_1)
					next_state = s1;
				
				else if(coin_in == rupee_2)
					next_state = s2;
			s1:
				if(coin_in == rupee_0)
					next_state = s1;
					
				else if(coin_in == rupee_1)
					next_state = s2;
					
				else if(coin_in == rupee_2)
					next_state = s3;
					
			s2:
				if( coin_in == rupee_0)
					next_state = s2;
					
				else if(coin_in == rupee_1)
					next_state = s3;
				
				else if(coin_in == rupee_2)
					next_state = s3;
					
			s3:
				next_state = idle;
				
				default next_state = idle;
			endcase
		end
			
	assign product_out = (present_state == s3);
endmodule
