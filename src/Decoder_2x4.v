`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2015 07:42:37 AM
// Design Name: 
// Module Name: Decoder_2x4
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


module Decoder_2x4( input enable, input [1:0]IN, output [3:0] OUT);
    assign OUT = ((IN==2'b00)? 4'b1110:
                 (IN==2'b01)? 4'b1101:
                 (IN==2'b10)? 4'b1011:
                              4'b0111) | {4{~enable}};
endmodule
