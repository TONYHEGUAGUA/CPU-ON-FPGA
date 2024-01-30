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
    input [7:0]Reg_a,Reg_b,RamM,regBtransmit,
    input Reg_ARisk, Reg_BRisk, Reg_MRisk,

    input PCwrite,
    input Awrite,Bwrite,Mwrite, //write enable
    output Awrite_delay,Bwrite_delay,Mwrite_delay,
    
    output [7:0]Reg_output,
    output [7:0] ALUout
    );

    //wirte(2) registor
    always@(posedge CLK)
    begin
        Awrite_delay <= ~PCwrite&Awrite;
        Bwrite_delay <= ~PCwrite&Bwrite;
        Mwrite_delay <= ~PCwrite&Mwrite;
    end

    ALU ALU_inst(ARisk,BRisk,MRisk,opcode[2:0],Reg_a,Reg_b,RamM,Reg_output,ALUout);
    outputregister outputregister_inst(CLK ,ALUout,regBtransmit, Reg_output);

endmodule
