`timescale 1ns / 1ps

module ALU(input [2:0]opcode, input [15:0]X, input [15:0]Y,  
            output [15:0]out, output Cout, output lt, output eq, output V);
    wire [15:0]orOp, andOp, addition, subtraction, sltOp, branchOp, g, h, j, k, l;
    wire [1:0]c, o;
    
    // LOGICAL AND (0)
    and andarray[15:0](andOp, X, Y);
        
    // LOGICAL OR (1)
    or orarray[15:0](orOp, X, Y);

    // ADDITION (2)
    FULLADDER ADD(X, Y, 1'b0, addition, c[0], o[0]);
    
    // SUBTRACTION (6)
    FULLADDER SUBTRACT(X, Y, 1'b1, subtraction, c[1], c[0]);
    
    // SET LESS THAN (7)
    and (lt, subtraction[15], 1'b1);              // If X < Y, MSB of out will be 1 (negative, so and with 1 to get lt)
    MUX_16b_2to1 SLT(16'b0000000000000000, 16'b1111111111111111, lt, sltOp);
    
    // BRANCH NOT EQUAL (E/14)
    //FULLADDER BNE(X, Y, 1'b1, j);       // Subtract X and Y, then AND the inverse of the output. if all inverted 
                                                // output bits are 1 then they are equal (if X=Y, then X-Y=0)
    and (eq, ~subtraction[15], ~subtraction[14], ~subtraction[13], ~subtraction[12], ~subtraction[11], ~subtraction[10], ~subtraction[9], ~subtraction[8], 
             ~subtraction[7],  ~subtraction[6],  ~subtraction[5],  ~subtraction[4],  ~subtraction[3],  ~subtraction[2],  ~subtraction[1], ~subtraction[0]);
    //not (eq, t);                        // Invert t to get not equal
    MUX_16b_2to1 BNEOP(16'b0000000000000000, 16'b1111111111111111, eq, branchOp);

    //opcode MUXs
    MUX_16b_2to1 MUX1(andOp, orOp, opcode[0], g);
    MUX_16b_2to1 MUX2(subtraction, sltOp, opcode[0], h);
    
    MUX_16b_2to1 MUX3(g, addition, opcode[1], l);
    
    MUX_16b_2to1 MUX4(l, h, opcode[2], out);
   
    wire [1:0] y,z;
    and andCout1(y[0],c[0],~opcode[0]);
    and andCout2(z[0],c[1],opcode[0]);
    or orCout(Cout, y[0], z[0]);
    
    and andOV1(y[1],o[0],~opcode[0]);
    and andOV2(z[1],o[1],opcode[0]);
    or orOV(V, y[1], z[1]);
      
endmodule
