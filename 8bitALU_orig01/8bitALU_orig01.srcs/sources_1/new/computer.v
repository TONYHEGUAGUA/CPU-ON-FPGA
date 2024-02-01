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
    output [7:0]seg,
    output [7:0]MRegout,
    output [7:0]Regout,
    output [3:0]Regsel
    
    //BELOW FOR SIMULATION USE
    ,output [7:0]instraddr,Reg_b,Reg_a,Reg_output,RamM,

    output  Awrite,Bwrite,Mwrite,PCwrite
    
);
     //CLK switch
     wire stable_MANCLK;
     Button_stabilization Button_stabilization_inst(CLK100MHz,MANCLK,stable_MANCLK);
     reg CLK;
     always@(*)
     begin
     if(ina[0]==0)CLK=stable_MANCLK;
     else CLK=CLK100MHz;
     end 


     wire [7:0]Reg_a;
     wire [7:0]Reg_b;
     wire [7:0]RamM;
     wire Awrite,Bwrite,Mwrite,PCwrite;
     wire Awrite_delay,Bwrite_delay,Mwrite_delay;
     wire [7:0]ALUout;//the output of ALU
     wire [7:0]instraddr;
     wire [7:0]instr,regBtransmit;
     wire [2:0]opcode;
     wire [1:0]jumpcode;
     wire [0:2][7:0]ramdisplay;
     wire [7:0] Reg_output;
     wire Reg_ARisk, Reg_BRisk, Reg_MRisk;
     //confirm the instruction
     PCregister PCregister_inst(CLK,PCwrite,~PROGRAM1,~PROGRAM2,Reg_b,instraddr);

     instruction_fetch instruction_fetch_inst(CLK,instraddr,PCwrite,instr);//Here complete INSTRUCTION_FETCH
     
     instruction_decode instruction_decode_inst(CLK,instr,PCwrite,Awrite,Bwrite,Mwrite,opcode,jumpcode,regBtransmit,Reg_ARisk,Reg_BRisk,Reg_MRisk);//control whether change RegB or execute ALU
     
     instruction_execute instruction_execute_inst(CLK,opcode,Reg_a,Reg_b,RamM,regBtransmit,Reg_ARisk, Reg_BRisk, Reg_MRisk,PCwrite,Awrite,Bwrite,Mwrite,Awrite_delay,Bwrite_delay,Mwrite_delay,Reg_output,ALUout);//refresh the registers and output the seg.

     instruction_writeback instruction_writeback_inst(CLK,Awrite_delay,Bwrite_delay,Mwrite_delay,PCwrite,Reg_output,Reg_a,Reg_b,RamM,ramdisplay);//transmit the value from outputregister to Aregister,Bregister or RAM;
    
    //confirm PC counter's next step
    PCcontrol PCcontrol_inst(CLK,jumpcode,ALUout,PCwrite);
    
    assign seg = ALUout;//LEDs

    //display display_inst(CLK100MHz,ina,instraddr,Reg_a,Reg_b,RamM,ramdisplay,MRegout,Regout,Regsel);
    display display_inst(CLK100MHz,ina,instraddr,Reg_b,Bwrite_delay,Reg_output,ramdisplay,MRegout,Regout,Regsel);
    //In order to figuret out why PCreg doesn't work, I make a delay register.

endmodule