`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2016 05:15:04 PM
// Design Name: 
// Module Name: MUX_4B_2to1
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


module MUX_4B_2to1(input [3:0]x, input [3:0]y, input select, output [3:0]out);
    wire[3:0] a, b;
    and and1[3:0](a, x, ~select),
        and2[3:0](b, y,  select);
    or MUX[3:0](out, a, b);
endmodule
