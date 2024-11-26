`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:46 01/24/2024 
// Design Name: 
// Module Name:    fightingGame 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fightingGame(action1, action2, control, reset, clk, place1, place2, lives1, lives2);
	input [2:0] action1, action2;
	input control, reset, clk;
	output [1:0] place1, place2, lives1, lives2;
	
	wire final_clk;
	//clockDivider cd (clk , final_clk);
	assign final_clk = clk;
	wire [3:0] state1, state2;
	wire controlledClk;
	assign controlledClk = control & final_clk & ~(state1[1:0] == 2'b00 | state2[1:0] == 2'b00);
	player1 p1(action1, action2, state2[3:2], reset, controlledClk, state1);
	player2 p2(action2, action1, state1[3:2], reset, controlledClk, state2);
	assign place1 = state1[3:2];
	assign place2 = state2[3:2];
	assign lives1 = state1[1:0];
	assign lives2 = state2[1:0];
endmodule
