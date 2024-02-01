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
    input Awrite,Bwrite,Mwrite, //write enable
    input PCwrite,
    input [7:0]Reg_output,
    output [7:0]Reg_a,Reg_b,RamM,

    output [0:2][7:0]ramdisplay
    );

    reg [7:0]address;
    always@(*)
    begin
        if(Bwrite)address <= Reg_output;
        else address <= Reg_b;
    end//这里也需要注意可能存在竞争的问题，所以需要确定好address的值

    Aregister Aregister_inst(CLK,Awrite,Reg_output,Reg_a);
    Bregister Bregister_inst(CLK,Bwrite,Reg_output,Reg_b);
    RAM RAM_inst(address,Mwrite,CLK,Reg_output,RamM,ramdisplay);
endmodule
