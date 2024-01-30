`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/30 15:27:27
// Design Name: 
// Module Name: BRisk
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


module BRisk(
    input CLK,
    input [7:0]instr,
    input Bwrite,
    output reg Reg_BRisk
    );

    assign Rd[1:0] = instr[6:5];


    always @(posedge CLK)
    begin
        if(((~Rd[1]&~Rd[0])|~instr[7])&Bwrite)Reg_BRisk <= 1;
        else Reg_BRisk <= 0;
    end
endmodule
