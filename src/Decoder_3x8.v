`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2015 07:56:31 AM
// Design Name: 
// Module Name: Decoder_3x8
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


module Decoder_3x8(
    input enable,
    input [2:0]IN,
    output [7:0]OUT
    );
    Decoder_2x4 decoder_lower(~IN[2]&enable, IN[1:0], OUT[3:0]);
    Decoder_2x4 decoder_upper( IN[2]&enable, IN[1:0], OUT[7:4]);
    //assign OUT[7:4] = 4'b1111;
endmodule
