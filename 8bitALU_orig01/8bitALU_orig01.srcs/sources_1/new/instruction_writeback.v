`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/28 21:23:54
// Design Name: 
// Module Name: instruction_writeback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 将输出寄存器里面的值更新到A,B或者RAM
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_writeback(
    input CLK,
    input Awrite0,Bwrite0,Mwrite0,
    input [7:0]regBtransmit,
    input PCwrite,
    output [7:0]Reg_a,Reg_b,RamM,Reg_output,
    output [0:2][7:0]ramdisplay
    );
    wire Awrite,Bwrite,Mwrite;
    assign Awrite = ~PCwrite&Awrite0;
    assign Bwrite = ~PCwrite&Bwrite0;
    assign Mwrite = ~PCwrite&Mwrite0;

    Aregister Aregister_inst(CLK,Awrite,Reg_output,Reg_a);
    Bregister Bregister_inst(CLK,Bwrite,regBtransmit,Reg_output,Reg_b);
    RAM RAM_inst(Reg_b,Mwrite,CLK,Reg_output,RamM,ramdisplay);
endmodule
