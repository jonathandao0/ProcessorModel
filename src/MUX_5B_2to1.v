`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2016 02:03:59 AM
// Design Name: 
// Module Name: MUX_5B_2to1
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


module MUX_5B_2to1(input [4:0]x, input [4:0]y, input select, output [4:0]out);
    wire[4:0] a, b;
    and and1[4:0](a, x, ~select),
        and2[4:0](b, y,  select);
    or MUX[4:0](out, a, b);
endmodule
