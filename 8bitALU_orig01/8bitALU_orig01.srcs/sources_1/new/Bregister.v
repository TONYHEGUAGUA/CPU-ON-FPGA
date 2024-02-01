`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 11:10:07
// Design Name: 
// Module Name: Bregister
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


module Bregister(
    input CLK,Bwrite,
    input [7:0]Bytein,
    output [7:0] Byteout
);
    register register_inst(CLK,Bwrite,Bytein,Byteout);
endmodule
