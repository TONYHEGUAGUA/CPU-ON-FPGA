`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 23:11:27
// Design Name: 
// Module Name: Mux256bit
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


module Mux256bit(
    input write,
    input [7:0]addr,
    output [0:255]writeout
    );
wire m10, m11;
    Mux Mux_0 (write, addr[7], m10, m11);
    
    wire m20, m21, m22, m23;
    Mux Mux_1 (m10, addr[6], m20, m21);
    Mux Mux_2 (m11, addr[6], m22, m23);
    
    wire m30, m31, m32, m33, m34, m35, m36, m37;
    Mux Mux_3 (m20, addr[5], m30, m31);
    Mux Mux_4 (m21, addr[5], m32, m33);
    Mux Mux_5 (m22, addr[5], m34, m35);
    Mux Mux_6 (m23, addr[5], m36, m37);
    
    wire m40, m41, m42, m43, m44, m45, m46, m47, m48, m49, m410, m411, m412, m413, m414, m415;
    Mux Mux_7 (m30, addr[4], m40, m41);
    Mux Mux_8 (m31, addr[4], m42, m43);
    Mux Mux_9 (m32, addr[4], m44, m45);
    Mux Mux_10 (m33, addr[4], m46, m47);
    Mux Mux_11 (m34, addr[4], m48, m49);
    Mux Mux_12 (m35, addr[4], m410, m411);
    Mux Mux_13 (m36, addr[4], m412, m413);
    Mux Mux_14 (m37, addr[4], m414, m415);
    
    Mux16bit Mux16bit_0 (m40, addr[3:0], writeout[0:15]);
    Mux16bit Mux16bit_1 (m41, addr[3:0], writeout[16:31]);
    Mux16bit Mux16bit_2 (m42, addr[3:0], writeout[32:47]);
    Mux16bit Mux16bit_3 (m43, addr[3:0], writeout[48:63]);
    Mux16bit Mux16bit_4 (m44, addr[3:0], writeout[64:79]);
    Mux16bit Mux16bit_5 (m45, addr[3:0], writeout[80:95]);
    Mux16bit Mux16bit_6 (m46, addr[3:0], writeout[96:111]);
    Mux16bit Mux16bit_7 (m47, addr[3:0], writeout[112:127]);
    Mux16bit Mux16bit_8 (m48, addr[3:0], writeout[128:143]);
    Mux16bit Mux16bit_9 (m49, addr[3:0], writeout[144:159]);
    Mux16bit Mux16bit_10 (m410, addr[3:0], writeout[160:175]);
    Mux16bit Mux16bit_11 (m411, addr[3:0], writeout[176:191]);
    Mux16bit Mux16bit_12 (m412, addr[3:0], writeout[192:207]);
    Mux16bit Mux16bit_13 (m413, addr[3:0], writeout[208:223]);
    Mux16bit Mux16bit_14 (m414, addr[3:0], writeout[224:239]);
    Mux16bit Mux16bit_15 (m415, addr[3:0], writeout[240:255]);
endmodule
