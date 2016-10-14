`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2016 04:36:34 PM
// Design Name: 
// Module Name: PC
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


module PC(input [4:0]nextAddr, input clk, output [4:0]Addr);
    reg [4:0] Addr;
    initial Addr = 0;
    always @(posedge clk) begin
        Addr = nextAddr;
    end
endmodule
