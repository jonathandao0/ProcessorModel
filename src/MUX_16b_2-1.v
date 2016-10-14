`timescale 1ns / 1ps

module MUX_16b_2to1(input [15:0] a,input [15:0] b,input s,output [15:0] f);
    wire [15:0]c, d;
    
    and andarray1[15:0](c, ~s, a),
        andarray2[15:0](d,  s, b);
    or  orarray[15:0](f, c, d);
endmodule