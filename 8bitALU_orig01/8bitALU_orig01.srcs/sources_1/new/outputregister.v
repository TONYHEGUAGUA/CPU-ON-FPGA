`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/28 21:18:00
// Design Name: 
// Module Name: outputregister
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


module outputregister(
    input CLK,
    input ALUout,
    output reg Reg_output
    );
    always @(posedge clk ) begin
        Reg_output <= ALUout;
    end
endmodule
