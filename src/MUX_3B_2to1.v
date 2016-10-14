`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2016 02:07:29 AM
// Design Name: 
// Module Name: MUX_3B_2to1
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


module MUX_3B_2to1(input [2:0]x, input [2:0]y, input select, output [2:0]out);
    wire[2:0] a, b;
    and and1[2:0](a, x, ~select),
        and2[2:0](b, y,  select);
    or MUX[2:0](out, a, b);
endmodule
