`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2016 04:51:32 PM
// Design Name: 
// Module Name: PCplusOne
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


module PCplusOne(input [4:0]Addr, input clkEN, output [4:0]nextAddr);
    reg [4:0] nextAddr;
    always @(posedge clkEN) begin
        nextAddr = Addr + 1;
    end
endmodule
