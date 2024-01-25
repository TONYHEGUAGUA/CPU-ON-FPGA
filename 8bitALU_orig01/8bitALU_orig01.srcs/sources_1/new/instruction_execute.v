`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/16 10:14:17
// Design Name: 
// Module Name: instruction_execute
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


module instruction_execute(
    input CLK,
    input [2:0]opcode,
    input Awrite0,Bwrite0,Mwrite0,
    input [7:0]regBtransmit,
    input PCwrite,
    output [7:0]Reg_a,Reg_b,RamM,ALUout,
    output [0:2][7:0]ramdisplay
    );
    wire Awrite,Bwrite,Mwrite;
    assign Awrite = ~PCwrite&Awrite0;
    assign Bwrite = ~PCwrite&Bwrite0;
    assign Mwrite = ~PCwrite&Mwrite0;
    
    ALU ALU_inst(opcode[2:0],Reg_a,Reg_b,RamM,ALUout);
    Aregister Aregister_inst(CLK,Awrite,ALUout,Reg_a);
    Bregister Bregister_inst(CLK,Bwrite,regBtransmit,ALUout,Reg_b);
    RAM RAM_inst(Reg_b,Mwrite,CLK,ALUout,RamM,ramdisplay);

endmodule
