`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/30 15:31:27
// Design Name: 
// Module Name: MRisk
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


module MRisk(
 input CLK,
    input [7:0]instr,
    input Mwrite,
    output reg Reg_MRisk
    );
    wire [1:0]Rd;
    assign Rd[1:0] = instr[6:5];

    always @(posedge CLK)
    begin
        if(Rd[1]&~Rd[0]&Mwrite)Reg_MRisk <= 1;
        else Reg_MRisk <= 0;
    end
endmodule
