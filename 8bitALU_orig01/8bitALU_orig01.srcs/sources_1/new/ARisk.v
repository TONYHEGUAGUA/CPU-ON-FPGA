`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/30 15:14:44
// Design Name: 
// Module Name: ARisk
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


module ARisk(
    input CLK,
    input [7:0]instr,
    input Awrite,
    output reg Reg_ARisk
    );
    wire [1:0]Rd;
    assign Rd[1:0] = instr[6:5];


    always @(posedge CLK)
    begin
        if(~Rd[1]&Rd[0]&Awrite)Reg_ARisk <= 1;
        else Reg_ARisk <= 0;
    end
endmodule
