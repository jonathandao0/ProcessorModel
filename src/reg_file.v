`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2016 05:32:53 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(output [15:0]A, output [15:0]B, input [15:0]C, input [3:0]Aaddr, input [3:0]Baddr, input [3:0]Caddr, input Load, input clear, input clk, output [15:0] R0, output [15:0] R1, output [15:0] R2, output [15:0] R3);//, output [15:0] lineC04, output [15:0] lineC05);
    wire [15:0] lineC00, lineC01, lineC02, lineC03, lineC04, lineC05, lineC06, lineC07,
                lineC08, lineC09, lineC10, lineC11, lineC12, lineC13, lineC14, lineC15,
                inputC, chooseC, EN, Cload;
    
    // Decode Caddr to select register
    DECODER_16b addrC(Caddr[2:0], Caddr[3], chooseC);
    
    and LoadEN[15:0](Cload, chooseC, Load);
    or chooseArray[15:0](EN, Cload, clear);
    
    // MUX C input and clear input controlled by clear flag
    MUX_16b_2to1 clrMUX(C, 16'b0000_0000_0000_0000, clear, inputC);
        
    // registers, each register is enabled by the chooseC from the decoder to only change the value of the selected register
    REGISTER register00(clk, EN[0],  inputC, R0),
             register01(clk, EN[1],  inputC, R1),
             register02(clk, EN[2],  inputC, R2),
             register03(clk, EN[3],  inputC, R3),
             register04(clk, EN[4],  inputC, lineC04),
             register05(clk, EN[5],  inputC, lineC05),
             register06(clk, EN[6],  inputC, lineC06),
             register07(clk, EN[7],  inputC, lineC07),
             register08(clk, EN[8],  inputC, lineC08),
             register09(clk, EN[9],  inputC, lineC09),
             register10(clk, EN[10], inputC, lineC10),
             register11(clk, EN[11], inputC, lineC11),
             register12(clk, EN[12], inputC, lineC12),
             register13(clk, EN[13], inputC, lineC13),
             register14(clk, EN[14], inputC, lineC14),
             register15(clk, EN[15], inputC, lineC15);
    
    // take all register outputs and connect them to MUXs that choose based on Aaddr & Baddr and output them to A & B
    MUX_16b_16to1 MUXA(R0, R1, R2, R3, lineC04, lineC05, lineC06, lineC07,
                       lineC08, lineC09, lineC10, lineC11, lineC12, lineC13, lineC14, lineC15, 
                       Aaddr, A),
                  MUXB(R0, R1, R2, R3, lineC04, lineC05, lineC06, lineC07,
                       lineC08, lineC09, lineC10, lineC11, lineC12, lineC13, lineC14, lineC15, 
                       Baddr, B);
endmodule
