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
     wire [7:0]ALUout;//the output of ALU
     wire [7:0]instraddr;
     wire [7:0]instr,regBtransmit;
     wire [2:0]opcode;
     wire [1:0]jumpcode;
     wire [0:2][7:0]ramdisplay;
     
     //confirm the instruction
         wire activate,PCtraceback;
     wire [10:0]BHTdata;
     wire [2:0][7:0]PC_delay;
     wire [7:0]BTA;
     wire [1:0]CS;
     PCregister PCregister_inst(CLK,PCwrite,activate,CS[1],PCtraceback,~PROGRAM1,~PROGRAM2,Reg_b,BTA,instraddr,PC_delay);

     dynamic_predictor dynamic_predictor_inst(CLK,instraddr,PC_delay[2],BHTdata,BTA,CS,activate);
     
     instruction_fetch instruction_fetch_inst(CLK,instraddr,PCwrite,instr);//Here complete INSTRUCTION_FETCH
     
     instruction_decode instruction_decode_inst(CLK,instr,PCwrite,Awrite,Bwrite,Mwrite,opcode,jumpcode,regBtransmit);//control whether change RegB or execute ALU
     
     instruction_execute instruction_execute_inst(CLK,opcode,Awrite,Bwrite,Mwrite,regBtransmit,PCwrite,Reg_a,Reg_b,RamM,ALUout,ramdisplay);//refresh the registers and output the seg.


    //confirm PC counter's next step
    PCcontrol PCcontrol_inst(CLK,activate,jumpcode,ALUout,BHTdata,PCwrite,PCtraceback);
    
    assign seg = ALUout;//LEDs

    display display_inst(CLK100MHz,ina,instraddr,Reg_a,Reg_b,RamM,ramdisplay,MRegout,Regout,Regsel);
    
    //In order to figuret out why PCreg doesn't work, I make a delay register.

    //testing mode
    //assign MRegout = {7'b0000000,PCwrite};
    //seg_led(CLK100MHz,instraddr,instr,Regsel,Regout);
endmodule