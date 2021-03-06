`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2016 11:46:35 PM
// Design Name: 
// Module Name: InstrMemory
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


module InstrMemory1(input [4:0]addr, output [15:0]ins);
    reg [15:0]ins;
    
    always @(addr)
    case(addr)
                          //ctrl_adrA_adrB_adrC/offset        
        5'b00000: ins = 16'b1000_1111_0000_1110; // 00)       R0 = 0
        5'b00001: ins = 16'b1000_1111_0001_1110; // 01)       R1 = 0
        5'b00010: ins = 16'b1000_1111_0100_0000; // 02)       R4 = 1 (from MM)
        5'b00011: ins = 16'b1000_1111_0010_0001; // 03)       R2 <= MM[1] (3)
        5'b00100: ins = 16'b1000_1111_0011_0010; // 04)       R3 <= MM[2] (4)
        5'b00101: ins = 16'b0010_0001_0010_0001; // 05) LOOP: R1 = R1 + R2
        5'b00110: ins = 16'b0110_0011_0100_0011; // 06)       R3 = R3 - 1 (R3 = R3 - R4)
        5'b00111: ins = 16'b1110_0011_0000_1101; // 07)       BNE R3, 0, LOOP
        5'b01000: ins = 16'b1010_1111_0001_0111; // 08)       R1 -> MM[7] (12)
        5'b01001: ins = 16'b1000_1111_0011_0111; // 09)       R3 <= MM[7] (12)
        5'b01010: ins = 16'b1000_1111_0000_0110; // 10)       R0 = FF
        5'b01011: ins = 16'b1111_0000_0001_1111; // 11)       JMP 31
        5'b01100: ins = 16'b0000_0000_0000_0000;
        5'b01101: ins = 16'b0000_0000_0000_0000;  
        5'b01110: ins = 16'b0000_0000_0000_0000;
        5'b01111: ins = 16'b0000_0000_0000_0000; // Program 2: 30/5=6
        5'b10000: ins = 16'b1000_1111_0000_1110; // 16)       R0 <= MM[14] (0)
        5'b10001: ins = 16'b1000_1111_0100_0000; // 17)       R4 <= MM[0] (1)
        5'b10010: ins = 16'b1000_1111_0010_0100; // 18)       R2 <= MM[4] (5)
        5'b10011: ins = 16'b1000_1111_0011_0101; // 19)       R3 <= MM[5] (30)
        5'b10100: ins = 16'b0111_0011_0010_0101; // 20) LOOP: SLT R3, R2, R5   
        5'b10101: ins = 16'b1110_0101_1111_0011; // 21)       BNE R5, R15, END
        5'b10110: ins = 16'b0110_0011_0010_0011; // 22)       R3 = R3 - R2
        5'b10111: ins = 16'b0010_0000_0100_0000; // 23)       R0 = R0 + 1 
        5'b11000: ins = 16'b1111_0000_0001_0100; // 24)       JMP LOOP      
        5'b11001: ins = 16'b1111_0000_0000_0000; // 25) END:  JMP 0
        5'b11010: ins = 16'b0000_0000_0000_0000;
        5'b11011: ins = 16'b0000_0000_0000_0000;
        5'b11100: ins = 16'b0000_0000_0000_0000;
        5'b11101: ins = 16'b0000_0000_0000_0000;
        5'b11110: ins = 16'b0000_0000_0000_0000;  
        5'b11111: ins = 16'b1111_0000_0001_0000; // 31) JMP 16
    endcase
endmodule
