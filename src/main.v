`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2016 04:29:05 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input clkEN, 
    output [0:6] SEG,
    output DP,
    output [7:0] AN,
    output [4:0] LED/*,
    // For simulation testing
    output [15:0] R0,
    output [15:0] R1,
    output [15:0] R2,
    output [15:0] R3,
    output [15:0] R4,
    output [15:0] R5
    */
    );    
    wire [15:0]ins, A, B, C, ALUb, ALUout, memOut, R0, R1, R2, R3;
    wire [10:0] PCplusOneDummy;
    wire [2:0]ALUOp;
    wire regDst, regWrt, aluSrc, memWrt, memRead, memToReg, branch, jump;
    wire [4:0] PCaddr, PCinc, nextPCAddr, PCplusOne, branchOut;
    wire [3:0] Caddr, debounceOut;
    wire cout, ltFlag, zeroFlag, branchEN;
    
    PC programCounter(nextPCAddr, clkEN, PCaddr);
    debounce debouncer(clk, 1'b0, {3'b000, clkEN}, debounceOut);
    PCplusOne PCincrement(PCaddr, debounceOut[0], PCinc);
    InstrMemory1 insMem(PCaddr, ins);
    control CU(ins[15:12], regDst, regWrt, aluSrc, ALUOp, memWrt, memRead, memToReg, branch, jump);
    
    MUX_4B_2to1 CaddrMUX(ins[7:4], ins[3:0], regDst, Caddr);
    reg_file regFile(A, B, C, ins[11:8], ins[7:4], Caddr, regWrt, 1'b0, debounceOut[0], R0, R1, R2, R3);//, R4, R5);
    
    MUX_16b_2to1 CoutMUX(B, {ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3:0]}, aluSrc, ALUb);
    
    ALU aritmatic(ALUOp, A, ALUb, ALUout, cout, ltFlag, zeroFlag);
    dataMemory dataMem(debounceOut[0], memWrt, ALUout[4:0], B, memOut);
    
    MUX_16b_2to1 memToRegMUX(ALUout, memOut, memToReg, C);
    
    and branchSelect(branchEN, branch, ~zeroFlag);
    
    // sign extension of ins[3:0]
    ALU PCadd(3'b010, {11'b0000_0000_000, PCinc}, {ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3], ins[3:0]}, {PCplusOneDummy, PCplusOne});
    MUX_5B_2to1 PCBranchMUX(PCinc, PCplusOne, branchEN, branchOut);
    MUX_5B_2to1 nextPCAddrMUX(branchOut, ins[4:0], jump, nextPCAddr);
    
    DisplayController Display(clk,{3'b000, PCaddr[4:0]}, R0[7:0], R1[7:0], R2[7:0], R3[7:0], SEG, DP, AN, LED);
endmodule
