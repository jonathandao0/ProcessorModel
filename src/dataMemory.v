`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2016 02:05:40 AM
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(input clk, input write, input [4:0]addr, input [15:0]datain, output [15:0]dataout);
    reg [15:0] register00, register01, register02, register03, register04, register05, register06, register07,
               register08, register09, register10, register11, register12, register13, register14, register15,
               register16, register17, register18, register19, register20, register21, register22, register23,
               register24, register25, register26, register27, register28, register29, register30, register31;
    wire [31:0] select, writeEN;
    initial register00 = 1;
    initial register01 = 3; 
    initial register02 = 4; 
    initial register03 = 26;
    initial register04 = 5;
    initial register05 = 30;
    initial register06 = 16'b1111_1111_1111_1111; 
    initial register07 = 0; // reserved
    initial register08 = 0; 
    initial register09 = 0; 
    initial register10 = 8;
    initial register11 = 0;
    initial register12 = 0; 
    initial register13 = 0; 
    initial register14 = 0; 
    initial register15 = 16'b1111_1111_1111_1111;
    initial register16 = 0;
    initial register17 = 0;
    initial register18 = 0; 
    initial register19 = 0; 
    initial register20 = 0;
    initial register21 = 0;
    initial register22 = 0; 
    initial register23 = 0; 
    initial register24 = 0; 
    initial register25 = 0;
    initial register26 = 0;
    initial register27 = 0;
    initial register28 = 0; 
    initial register29 = 0; 
    initial register30 = 0;
    initial register31 = 0;
    
    DECODER_32b address(addr, select);
    
    and andarray[31:0](writeEN, select, write);
    always @(posedge clk) begin
        case(writeEN)
        32'b0000_0000_0000_0000_0000_0000_0000_0001: register00 = datain;
        32'b0000_0000_0000_0000_0000_0000_0000_0010: register01 = datain;
        32'b0000_0000_0000_0000_0000_0000_0000_0100: register02 = datain;
        32'b0000_0000_0000_0000_0000_0000_0000_1000: register03 = datain;
        32'b0000_0000_0000_0000_0000_0000_0001_0000: register04 = datain;
        32'b0000_0000_0000_0000_0000_0000_0010_0000: register05 = datain;
        32'b0000_0000_0000_0000_0000_0000_0100_0000: register06 = datain;
        32'b0000_0000_0000_0000_0000_0000_1000_0000: register07 = datain;
        32'b0000_0000_0000_0000_0000_0001_0000_0000: register08 = datain;
        32'b0000_0000_0000_0000_0000_0010_0000_0000: register09 = datain;
        32'b0000_0000_0000_0000_0000_0100_0000_0000: register10 = datain;
        32'b0000_0000_0000_0000_0000_1000_0000_0000: register11 = datain;
        32'b0000_0000_0000_0000_0001_0000_0000_0000: register12 = datain;
        32'b0000_0000_0000_0000_0010_0000_0000_0000: register13 = datain;
        32'b0000_0000_0000_0000_0100_0000_0000_0000: register14 = datain;
        32'b0000_0000_0000_0000_1000_0000_0000_0000: register15 = datain;
        32'b0000_0000_0000_0001_0000_0000_0000_0000: register16 = datain;
        32'b0000_0000_0000_0010_0000_0000_0000_0000: register17 = datain;
        32'b0000_0000_0000_0100_0000_0000_0000_0000: register18 = datain;
        32'b0000_0000_0000_1000_0000_0000_0000_0000: register19 = datain;
        32'b0000_0000_0001_0000_0000_0000_0000_0000: register20 = datain;
        32'b0000_0000_0010_0000_0000_0000_0000_0000: register21 = datain;
        32'b0000_0000_0100_0000_0000_0000_0000_0000: register22 = datain;
        32'b0000_0000_1000_0000_0000_0000_0000_0000: register23 = datain;
        32'b0000_0001_0000_0000_0000_0000_0000_0000: register24 = datain;
        32'b0000_0010_0000_0000_0000_0000_0000_0000: register25 = datain;
        32'b0000_0100_0000_0000_0000_0000_0000_0000: register26 = datain;
        32'b0000_1000_0000_0000_0000_0000_0000_0000: register27 = datain;
        32'b0001_0000_0000_0000_0000_0000_0000_0000: register28 = datain;
        32'b0010_0000_0000_0000_0000_0000_0000_0000: register29 = datain;
        32'b0100_0000_0000_0000_0000_0000_0000_0000: register30 = datain;
        32'b1000_0000_0000_0000_0000_0000_0000_0000: register31 = datain;
        endcase
    end
    
    MUX16b_32to1 MUXO(register00, register01, register02, register03, register04, register05, register06, register07,
                      register08, register09, register10, register11, register12, register13, register14, register15,
                      register16, register17, register18, register19, register20, register21, register22, register23,
                      register24, register25, register26, register27, register28, register29, register30, register31,
                      addr, dataout);
endmodule
