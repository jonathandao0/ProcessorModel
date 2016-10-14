`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2016 06:29:54 PM
// Design Name: 
// Module Name: FULLADDER
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


module FULLADDER(input [15:0]a, input [15:0]b, input Cin, output [15:0]f, output Cout, output o);
    wire [14:0]c;
    wire [15:0]x;
    
    xor xorarray[15:0](x, Cin, b),
        (o, Cout, c[14]);
    
    ADDER FA[15:0](a, x, {c, Cin}, {Cout, c}, f);
endmodule
