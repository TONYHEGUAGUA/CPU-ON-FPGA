`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 19:51:42
// Design Name: 
// Module Name: computer
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


  module computer(
    input CLK100MHz,CLK3Hz,MANCLK,
    input [3:0]ina,
    input [3:0]inb,
    input PROGRAM1,PROGRAM2,
    output [7:0]ALUout,
    output [7:0]MRegout,
    output [7:0]Regout,
    output [3:0]Regsel

    //,output [7:0]instraddr,instr,Reg_b,Reg_a,
    //output [2:0]opcode,
    //output PCwrite
);
     //CLK switch
     reg CLK;
     always@(*)
     begin
     if(ina[0]==0)CLK=MANCLK;
     else CLK=CLK100MHz;
     end 


     wire [7:0]Reg_a;
     wire [7:0]Reg_b;
     wire [7:0]RamM;
     reg Awrite,Bwrite,Mwrite,PCwrite;
     wire [7:0]seg;//the output of ALU
     wire [7:0]instraddr;
     wire [7:0]instr,regBtransmit;
     wire [2:0]opcode;
     wire [1:0]jumpcode;
     
     //confirm the instruction
     PCregister PCregister_inst(CLK,PCwrite,~PROGRAM1,~PROGRAM2,Reg_b,instraddr);
     instruction_fetch instruction_fetch_inst(CLK,instraddr,PCwrite,instr);//Here complete INSTRUCTION_FETCH
     
     instruction_decode instruction_decode_inst(CLK,instr,PCwrite,Awrite,Bwrite,Mwrite,opcode,jumpcode,regBtransmit);//control whether change RegB or execute ALU
     
     instruction_execute instruction_execute_inst(CLK,opcode,Awrite,Bwrite,Mwrite,regBtransmit,PCwrite,Reg_a,Reg_b,RamM,seg);//refresh the registers and output the seg.

    
    //confirm PC counter's next step
    PCcontrol PCcontrol_inst(CLK,jumpcode,seg,PCwrite);
    
    assign ALUout = seg;
    
    assign MRegout = RamM;//Show regM
    seg_led seg_led_inst(CLK100MHz,instraddr,Reg_b,Regsel,Regout);// Show regA and Reg_b
    
    //In order to figuret out why PCreg doesn't work, I make a delay register.

    //testing mode
    //assign MRegout = {7'b0000000,PCwrite};
    //seg_led(CLK100MHz,instraddr,instr,Regsel,Regout);
endmodule