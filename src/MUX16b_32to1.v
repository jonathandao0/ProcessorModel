`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2016 11:18:57 PM
// Design Name: 
// Module Name: MUX16b_32to1
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


module MUX16b_32to1(input [15:0]a00, input [15:0]a01, input [15:0]a02, input [15:0]a03,
                    input [15:0]a04, input [15:0]a05, input [15:0]a06, input [15:0]a07,
                    input [15:0]a08, input [15:0]a09, input [15:0]a10, input [15:0]a11,
                    input [15:0]a12, input [15:0]a13, input [15:0]a14, input [15:0]a15,
                    input [15:0]a16, input [15:0]a17, input [15:0]a18, input [15:0]a19,
                    input [15:0]a20, input [15:0]a21, input [15:0]a22, input [15:0]a23,
                    input [15:0]a24, input [15:0]a25, input [15:0]a26, input [15:0]a27,
                    input [15:0]a28, input [15:0]a29, input [15:0]a30, input [15:0]a31,
                    input [4:0]s, output [15:0]out);
    
    wire [15:0]line00, line01, line02, line03, line04, line05, line06, line07,
               line08, line09, line10, line11, line12, line13, line14, line15,
               line16, line17, line18, line19, line20, line21, line22, line23,
               line24, line25, line26, line27, line28, line29, line30, line31;
    
    and andarray00[15:0](line00, ~s[4], ~s[3], ~s[2], ~s[1], ~s[0], a00),
        andarray01[15:0](line01, ~s[4], ~s[3], ~s[2], ~s[1],  s[0], a01),
        andarray02[15:0](line02, ~s[4], ~s[3], ~s[2],  s[1], ~s[0], a02),
        andarray03[15:0](line03, ~s[4], ~s[3], ~s[2],  s[1],  s[0], a03),
        andarray04[15:0](line04, ~s[4], ~s[3],  s[2], ~s[1], ~s[0], a04),
        andarray05[15:0](line05, ~s[4], ~s[3],  s[2], ~s[1],  s[0], a05),
        andarray06[15:0](line06, ~s[4], ~s[3],  s[2],  s[1], ~s[0], a06),
        andarray07[15:0](line07, ~s[4], ~s[3],  s[2],  s[1],  s[0], a07),
        andarray08[15:0](line08, ~s[4],  s[3], ~s[2], ~s[1], ~s[0], a08),
        andarray09[15:0](line09, ~s[4],  s[3], ~s[2], ~s[1],  s[0], a09),
        andarray10[15:0](line10, ~s[4],  s[3], ~s[2],  s[1], ~s[0], a10),
        andarray11[15:0](line11, ~s[4],  s[3], ~s[2],  s[1],  s[0], a11),
        andarray12[15:0](line12, ~s[4],  s[3],  s[2], ~s[1], ~s[0], a12),
        andarray13[15:0](line13, ~s[4],  s[3],  s[2], ~s[1],  s[0], a13),
        andarray14[15:0](line14, ~s[4],  s[3],  s[2],  s[1], ~s[0], a14),
        andarray15[15:0](line15, ~s[4],  s[3],  s[2],  s[1],  s[0], a15),
        andarray16[15:0](line16,  s[4], ~s[3], ~s[2], ~s[1], ~s[0], a16),
        andarray17[15:0](line17,  s[4], ~s[3], ~s[2], ~s[1],  s[0], a17),
        andarray18[15:0](line18,  s[4], ~s[3], ~s[2],  s[1], ~s[0], a18),
        andarray19[15:0](line19,  s[4], ~s[3], ~s[2],  s[1],  s[0], a19),
        andarray20[15:0](line20,  s[4], ~s[3],  s[2], ~s[1], ~s[0], a20),            
        andarray21[15:0](line21,  s[4], ~s[3],  s[2], ~s[1],  s[0], a21),
        andarray22[15:0](line22,  s[4], ~s[3],  s[2],  s[1], ~s[0], a22),
        andarray23[15:0](line23,  s[4], ~s[3],  s[2],  s[1],  s[0], a23),
        andarray24[15:0](line24,  s[4],  s[3], ~s[2], ~s[1], ~s[0], a24),
        andarray25[15:0](line25,  s[4],  s[3], ~s[2], ~s[1],  s[0], a25),
        andarray26[15:0](line26,  s[4],  s[3], ~s[2],  s[1], ~s[0], a26),
        andarray27[15:0](line27,  s[4],  s[3], ~s[2],  s[1],  s[0], a27),
        andarray28[15:0](line28,  s[4],  s[3],  s[2], ~s[1], ~s[0], a28),
        andarray29[15:0](line29,  s[4],  s[3],  s[2], ~s[1],  s[0], a29),
        andarray30[15:0](line30,  s[4],  s[3],  s[2],  s[1], ~s[0], a30),  
        andarray31[15:0](line31,  s[4],  s[3],  s[2],  s[1],  s[0], a31);
        
        or  oroutput[15:0](out, line00, line01, line02, line03, line04, line05, line06, line07,
                                line08, line09, line10, line11, line12, line13, line14, line15,
                                line16, line17, line18, line19, line20, line21, line22, line23,
                                line24, line25, line26, line27, line28, line29, line30, line31);                   
endmodule
