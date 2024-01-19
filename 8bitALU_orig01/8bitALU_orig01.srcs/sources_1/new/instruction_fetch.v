`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/15 20:11:08
// Design Name: 
// Module Name: instruction_fetch
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


module instruction_fetch(
    input CLK,
    input [7:0]instraddr,
    input PCwrite,
    output reg [7:0] instr
    );

    wire [7:0]instr_ROM;
    ROM ROM_inst(instraddr,instr_ROM);

    always @(posedge CLK)
        begin
        if(PCwrite)instr<=8'b10000000;
        else instr <= instr_ROM;
        end
endmodule
