`timescale 1ns / 1ps

module control(input[3:0] ins, 
    output REG_DEST, output REG_WRITE, output ALU_SOURCE, 
    output [2:0]ALU_control, output MEM_WRITE, output MEM_READ,
    output MEM_TO_REG, output BRANCH, output JUMP);
    
    //wire operation[2:0];
    /*
    // outputs for each control line
    MUX_1B_2to1 regDEST(REG_DEST, 1'b1, 1'b0, ~ins[3]);
    MUX_1B_2to1 memTOREG(MEM_TO_REG, 1'b0, 1'b1, ~ins[3]);
    
	MUX_1B_2to1 aluSOURCE(ALU_SOURCE, 1'b1, 1'b0, ins[3]&~ins[2]&~ins[0]);
    MUX_1B_2to1 regWRITE(REG_WRITE, 1'b1, 1'b0, ~ins[3]|(~ins[2]&~ins[1]&~ins[0]));
    MUX_1B_2to1 memWRITE(MEM_WRITE, 1'b1, 1'b0, ins[3]&~ins[2]&ins[1]&~ins[0]);
    MUX_1B_2to1 branch(BRANCH, 1'b1, 1'b0, ins[3]&ins[2]&ins[1]&~ins[0]);
    MUX_1B_2to1 jump(JUMP, 1'b1, 1'b0, ins[3]&ins[2]&ins[1]&ins[0]);
    
    // LW, SW, and BNE ALU operations
    MUX_1B_2to1 opBit2(operation[2], 1'b0, 1'b1, ins[3]&~ins[2]&~ins[0]);   
    MUX_1B_2to1 opBit1(operation[1], 1'b1, 1'b1, ins[3]&~ins[2]&~ins[0]);
    MUX_1B_2to1 opBit0(operation[0], 1'b0, 1'b0, ins[3]&~ins[2]&~ins[0]);
    
    // distinguish between R-format ALUop or LW, SW, and BNE ALUop
    MUX_1B_2to1 aluCONTROL2(ALU_control[2], ins[2], operation[2], ~ins[3]);
    MUX_1B_2to1 aluCONTROL1(ALU_control[1], ins[1], operation[1], ~ins[3]);
    MUX_1B_2to1 aluCONTROL0(ALU_control[0], ins[0], operation[0], ~ins[3]);
    */
	
	wire tmp;
	wire [2:0] ALUtmp;
	not(REG_DEST,    ins[3]),
	   (MEM_TO_REG, ~ins[3]);
	and ALU_src(ALU_SOURCE, ins[3], ~ins[2], ~ins[0]),
		m_w(MEM_WRITE, ins[3], ~ins[2], ins[1], ~ins[0]),
		b(BRANCH, ins[3], ins[2], ins[1], ~ins[0]),
		j(JUMP, ins[3], ins[2], ins[1],  ins[0]),
		temp(tmp, ~ins[2], ~ins[1], ~ins[0]);
	or r_w(REG_WRITE, ~ins[3], tmp);
	
    MUX_3B_2to1 MUX3B1(ins[2:0], 3'b010, ins[3], ALUtmp);
    MUX_3B_2to1 MUX3B2(ALUtmp, 3'b110, BRANCH, ALU_control);
	
endmodule
