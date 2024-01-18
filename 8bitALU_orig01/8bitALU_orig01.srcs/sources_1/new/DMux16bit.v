`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 00:11:27
// Design Name: 
// Module Name: DMux16bit
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


module DMux16bit(
    input [0:15][7:0]Memory,
    input [3:0]addr,
    output [7:0]Memoryout
    );
    wire [7:0]M10,M11,M12,M13,M14,M15,M16,M17;
    DMux DMux_0 (Memory[0], Memory[1], addr[0], M10);
    DMux DMux_1 (Memory[2], Memory[3], addr[0], M11);
    DMux DMux_2 (Memory[4], Memory[5], addr[0], M12);
    DMux DMux_3 (Memory[6], Memory[7], addr[0], M13);
    DMux DMux_4 (Memory[8], Memory[9], addr[0], M14);
    DMux DMux_5 (Memory[10], Memory[11], addr[0], M15);
    DMux DMux_6 (Memory[12], Memory[13], addr[0], M16);
    DMux DMux_7 (Memory[14], Memory[15], addr[0], M17);
    
    wire [7:0] M20, M21, M22, M23;
    DMux DMux_8 (M10, M11, addr[1], M20);
    DMux DMux_9 (M12, M13, addr[1], M21);
    DMux DMux_10 (M14, M15, addr[1], M22);
    DMux DMux_11 (M16, M17, addr[1], M23);
    
    wire [7:0] M30, M31;
    DMux DMux_12 (M20, M21, addr[2], M30);
    DMux DMux_13 (M22, M23, addr[2], M31);
    
    DMux DMux_14 (M30, M31, addr[3], Memoryout);
endmodule
