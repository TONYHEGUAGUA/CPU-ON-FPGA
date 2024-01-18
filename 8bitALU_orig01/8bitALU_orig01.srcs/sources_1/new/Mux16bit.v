`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 22:19:38
// Design Name: 
// Module Name: Mux16bit
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


module Mux16bit(
    input write,
    input [3:0] addr,
    output [0:15] writeout
);

    wire m10, m11;
    Mux Mux_0 (write, addr[3], m10, m11);

    wire m20, m21, m22, m23;
    Mux Mux_1 (m10, addr[2], m20, m21);
    Mux Mux_2 (m11, addr[2], m22, m23);

    wire m30, m31, m32, m33, m34, m35, m36, m37;
    Mux Mux_3 (m20, addr[1], m30, m31);
    Mux Mux_4 (m21, addr[1], m32, m33);
    Mux Mux_5 (m22, addr[1], m34, m35);
    Mux Mux_6 (m23, addr[1], m36, m37);

    Mux Mux_7 (m30, addr[0], writeout[0], writeout[1]);
    Mux Mux_8 (m31, addr[0], writeout[2], writeout[3]);
    Mux Mux_9 (m32, addr[0], writeout[4], writeout[5]);
    Mux Mux_10 (m33, addr[0], writeout[6], writeout[7]);
    Mux Mux_11 (m34, addr[0], writeout[8], writeout[9]);
    Mux Mux_12 (m35, addr[0], writeout[10], writeout[11]);
    Mux Mux_13 (m36, addr[0], writeout[12], writeout[13]);
    Mux Mux_14 (m37, addr[0], writeout[14], writeout[15]);

endmodule
