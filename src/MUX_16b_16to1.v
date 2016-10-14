`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2016 06:35:20 PM
// Design Name: 
// Module Name: MUX_16b_16to1
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

module MUX_16b_16to1(input [15:0]a, input [15:0]b, input [15:0]c, input [15:0]d,
                     input [15:0]e, input [15:0]f, input [15:0]g, input [15:0]h,
                     input [15:0]i, input [15:0]j, input [15:0]k, input [15:0]l,
                     input [15:0]m, input [15:0]n, input [15:0]o, input [15:0]p,
                     input [3:0]s, output [15:0]out);
    wire [15:0]line00, line01, line02, line03, line04, line05, line06, line07,
               line08, line09, line10, line11, line12, line13, line14, line15;
    
    and andarray00[15:0](line00, ~s[3], ~s[2], ~s[1], ~s[0], a),
        andarray01[15:0](line01, ~s[3], ~s[2], ~s[1],  s[0], b),
        andarray02[15:0](line02, ~s[3], ~s[2],  s[1], ~s[0], c),
        andarray03[15:0](line03, ~s[3], ~s[2],  s[1],  s[0], d),
        andarray04[15:0](line04, ~s[3],  s[2], ~s[1], ~s[0], e),
        andarray05[15:0](line05, ~s[3],  s[2], ~s[1],  s[0], f),
        andarray06[15:0](line06, ~s[3],  s[2],  s[1], ~s[0], g),
        andarray07[15:0](line07, ~s[3],  s[2],  s[1],  s[0], h),
        andarray08[15:0](line08,  s[3], ~s[2], ~s[1], ~s[0], i),
        andarray09[15:0](line09,  s[3], ~s[2], ~s[1],  s[0], j),
        andarray10[15:0](line10,  s[3], ~s[2],  s[1], ~s[0], k),
        andarray11[15:0](line11,  s[3], ~s[2],  s[1],  s[0], l),
        andarray12[15:0](line12,  s[3],  s[2], ~s[1], ~s[0], m),
        andarray13[15:0](line13,  s[3],  s[2], ~s[1],  s[0], n),
        andarray14[15:0](line14,  s[3],  s[2],  s[1], ~s[0], o),
        andarray15[15:0](line15,  s[3],  s[2],  s[1],  s[0], p);
        
    or  oroutput[15:0](out, line00, line01, line02, line03, line04, line05, line06, line07,
                            line08, line09, line10, line11, line12, line13, line14, line15);
endmodule

