`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 00:23:24
// Design Name: 
// Module Name: DMux256bit
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


module DMux256bit(
    input [0:255][7:0] Memory,
    input [7:0] addr,
    output [7:0] Memoryout
    );
    wire [0:15] [7:0] M;
    DMux16bit DMux16bit_0(Memory[0:15], addr[3:0], M[0]);
    DMux16bit DMux16bit_1(Memory[16:31], addr[3:0], M[1]);
    DMux16bit DMux16bit_2(Memory[32:47], addr[3:0], M[2]);
    DMux16bit DMux16bit_3(Memory[48:63], addr[3:0], M[3]);
    DMux16bit DMux16bit_4(Memory[64:79], addr[3:0], M[4]);
    DMux16bit DMux16bit_5(Memory[80:95], addr[3:0], M[5]);
    DMux16bit DMux16bit_6(Memory[96:111], addr[3:0], M[6]);
    DMux16bit DMux16bit_7(Memory[112:127], addr[3:0], M[7]);
    DMux16bit DMux16bit_8(Memory[128:143], addr[3:0], M[8]);
    DMux16bit DMux16bit_9(Memory[144:159], addr[3:0], M[9]);
    DMux16bit DMux16bit_10(Memory[160:175], addr[3:0], M[10]);
    DMux16bit DMux16bit_11(Memory[176:191], addr[3:0], M[11]);
    DMux16bit DMux16bit_12(Memory[192:207], addr[3:0], M[12]);
    DMux16bit DMux16bit_13(Memory[208:223], addr[3:0], M[13]);
    DMux16bit DMux16bit_14(Memory[224:239], addr[3:0], M[14]);
    DMux16bit DMux16bit_15(Memory[240:255], addr[3:0], M[15]);
    
    DMux16bit Dmux16bit_16(M, addr[7:4], Memoryout);
endmodule
