`timescale 1ns / 1ps

module DECODER_3to8(input [2:0] a, input e, output [7:0] f);
    
    and (f[0], ~a[2], ~a[1], ~a[0], e),
        (f[1], ~a[2], ~a[1],  a[0], e),
        (f[2], ~a[2],  a[1], ~a[0], e),
        (f[3], ~a[2],  a[1],  a[0], e),
        (f[4],  a[2], ~a[1], ~a[0], e),
        (f[5],  a[2], ~a[1],  a[0], e),
        (f[6],  a[2],  a[1], ~a[0], e),
        (f[7],  a[2],  a[1],  a[0], e);
endmodule