`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2016 06:55:59 PM
// Design Name: 
// Module Name: DECODER_16b
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


module DECODER_16b(input [2:0] a, input e, output [15:0] f);
    DECODER_3to8 DEC1(a, ~e, f[7:0]);
    DECODER_3to8 DEC2(a,  e, f[15:8]);
endmodule
