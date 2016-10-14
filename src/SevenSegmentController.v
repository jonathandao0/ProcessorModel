`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2015 07:42:15 AM
// Design Name: 
// Module Name: SevenSegmentController
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


module DisplayController(
    input clk,
    input [7:0] PC, R0, R1, R2, R3,
    output [0:6] SEG7,
    output DP,
    output [7:0] AN,
    output [4:0] LED
    );
    
    assign LED = PC[4:0];
    wire [3:0] segment_data;
    // Multiplexing the anodes
    Decoder_3x8 decoder38(1'b1,display_counter[18:16],AN);
    
    // Multiplexing the cathodes
    Mux_8x1_4bit mux(display_counter[18:16], R0[7:4], R0[3:0], R1[7:4], R1[3:0],R2[7:4], R2[3:0], R3[7:4], R3[3:0],segment_data);
    assign DP = 1; //(display_counter[18:16]==2)?0:1;
    // Seven Segment Decoder
    SevenSegDecoder decoder7Seg(segment_data,SEG7);
    
    // Display counter to toggle anodes/inputs
    reg [18:0] display_counter = 0;
    always @ (posedge clk)
        display_counter <= display_counter + 1;
endmodule
