`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/15 20:28:06
// Design Name: 
// Module Name: instruction_decode
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


module instruction_decode(
    input CLK,
    input [7:0]instr,
    input PCwrite,
    output reg Awrite,Bwrite,Mwrite,
    output reg [2:0]opcode,
    output reg [1:0]jumpcode,
    output reg [7:0]regBtransmit
    );
    wire type;
    wire [1:0]Rd;
    
    assign type = ~PCwrite&instr[7];
    assign Rd[1:0] = instr[6:5];
    always @(posedge CLK)
    begin
        //confirm destinatin of ALU output
    Bwrite <= (type&~Rd[1]&~Rd[0])|(~PCwrite&~instr[7]);//右边的条件表示立即数操作
    Awrite <= type&~Rd[1]&Rd[0];
    Mwrite <= type&Rd[1]&~Rd[0];
    
    opcode[2] <= type&instr[4];
    opcode[1] <= type&instr[3];
    opcode[0] <= type&instr[2];
    jumpcode[1] <= type&instr[1];
    jumpcode[0] <= type&instr[0];
    regBtransmit[7:0] <= instr[7:0];
    end
endmodule
