`timescale 1ns / 1ps
/*
    Author:     Steven McNinch
    Project:    ECE 205L - Lab 2 - 4bit Adder/Subtractor with SevenSegDecoder
    Designed for Digilent Nexsy 4 Artix 7 FPGA Board
*/
module SevenSegDecoder(
    input [3:0]B,
    output reg [6:0]seven_seg
    );
    always @ B
    case(B)
        4'h0:seven_seg = 7'b0000001;
        4'h1:seven_seg = 7'b1001111;
        4'h2:seven_seg = 7'b0010010;
        4'h3:seven_seg = 7'b0000110;
        4'h4:seven_seg = 7'b1001100;
        4'h5:seven_seg = 7'b0100100;
        4'h6:seven_seg = 7'b0100000;
        4'h7:seven_seg = 7'b0001111;
        4'h8:seven_seg = 7'b0000000;
        4'h9:seven_seg = 7'b0000100;
        4'hA:seven_seg = 7'b0001000;
        4'hB:seven_seg = 7'b1100000;
        4'hC:seven_seg = 7'b0110001;
        4'hD:seven_seg = 7'b1000010;
        4'hE:seven_seg = 7'b0110000;
        4'hF:seven_seg = 7'b0111000;
    endcase
endmodule
