`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2015 08:21:01 AM
// Design Name: 
// Module Name: Mux_8x1_4bit
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


module Mux_8x1_4bit(
    input [2:0] sel,
    input [3:0] I7,I6,I5,I4,I3,I2,I1,I0,
    output [3:0] O
    );
    assign O = (sel==0)? I0:
               (sel==1)? I1:
               (sel==2)? I2:
               (sel==3)? I3:
               (sel==4)? I4:
               (sel==5)? I5:
               (sel==6)? I6:
                         I7;
endmodule
