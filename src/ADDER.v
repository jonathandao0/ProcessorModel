`timescale 1ns / 1ps

module ADDER(input a, input b, input Cin, output Cout, output s);
   wire [3:0]l;
    
    xor (s, a, b, Cin);
    and (l[0], a, b),
        (l[1], a, Cin),
        (l[2], b, Cin);
    or  (Cout, l[0], l[1], l[2]);
endmodule