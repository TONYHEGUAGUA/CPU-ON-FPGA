`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/24 10:20:47
// Design Name: 
// Module Name: Overflow_Flag
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


module Overflow_Flag(CLK,Reg_a,Reg_b,seg,Reg_overflow);
input [7:0] Reg_a;
input [7:0] Reg_b;
input [7:0] seg;
input CLK;
output reg Reg_overflow;
//reg [7:0] s;
always@(posedge CLK)
  //s=Reg_a+Reg_b;
  Reg_overflow=Reg_a[7] & Reg_b[7] & ~seg[7] | ~Reg_a[7] & ~Reg_b[7] & seg[7];
  //两个正数相加。正数的符号位为0，产生溢出时符号位会变成1，此时溢出位置1。两个负数相加。负数的符号位为1，产生溢出时符号位会变成0，此时溢出位置1。//
endmodule
