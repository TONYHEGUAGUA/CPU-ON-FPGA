`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/26 10:31:17
// Design Name: 
// Module Name: 32bitadder
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


module Int_adder(
    input  [31:0] Reg_intA , Reg_intB,
    input CLK,
    output [31:0] Reg_int_output,
    output Carry_int
    );
    wire [2:0] carry;
    Carry_Flag Carry_Flag_inst(Reg_intA[7:0] , Reg_intB[7:0] , 010 , CLK , carry[0]);
    Carry_Flag(Reg_intA[15:8] , Reg_intB[15:8] , 010 , CLK , carry[1]);
    Carry_Flag(Reg_intA[23:16] , Reg_intB[23:16] , 010 , CLK , carry[2]);
    Carry_Flag(Reg_intA[31:24] , Reg_intB[31:24] , 010 , CLK , Carry_int);
    
    //count carry0,1,2 in order to do full add 
    ALU ALU_inst(0,0,0,110,Reg_intA[7:0],Reg_intB[7:0],0,0,0,Reg_int_output[7:0]);
    ALU(0,0,0,010,Reg_intA[15:8],Reg_intB[15:8],0,0,carry[0],Reg_int_output[15:8]);
    ALU(0,0,0,010,Reg_intA[23:16],Reg_intB[23:16],0,0,carry[1],Reg_int_output[23:16]);
    ALU(0,0,0,010,Reg_intA[31:24],Reg_intB[31:24],0,0,carry[2],Reg_int_output[31:24]);
    //full add every 8bit in turns
endmodule
