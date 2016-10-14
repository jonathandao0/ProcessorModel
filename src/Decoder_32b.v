`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2016 05:36:04 PM
// Design Name: 
// Module Name: Decoder_32b
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


module DECODER_32b(input [4:0] a, output [31:0] f);
    wire [7:0]e;
    
    DECODER_3to8 DEC0({1'b0, a[4:3]}, 1'b1, e);
    DECODER_3to8 DEC1(a[2:0], e[0], f[7:0]);
    DECODER_3to8 DEC2(a[2:0], e[1], f[15:8]);
    DECODER_3to8 DEC3(a[2:0], e[2], f[23:16]);
    DECODER_3to8 DEC4(a[2:0], e[3], f[31:24]);
endmodule
