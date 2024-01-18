`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/16 10:30:55
// Design Name: 
// Module Name: PCcontrol
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PCcontrol 是一个在时序上与流水线的"执行"同步的控制器，它的工作是1、批准R1赋值到PC寄存器；
//2、拦截下一周期的"取指""解码""执行"操作
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PCcontrol(
    input CLK,
    input [1:0]jumpcode,
    input [7:0]seg,
    output reg PCwrite
    );
    always @(posedge CLK)
    PCwrite <= (jumpcode[1]&~seg[7]&~seg[6]&~seg[5]&~seg[4]&~seg[3]&~seg[2]&~seg[1]&~seg[0])|(jumpcode[0]&~seg[7]&(seg[6]|seg[5]|seg[4]|seg[3]|seg[2]|seg[1]|seg[0]))|(jumpcode[1]&jumpcode[0]);
endmodule
