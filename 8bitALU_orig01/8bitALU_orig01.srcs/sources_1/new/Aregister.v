`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 11:07:24
// Design Name: 
// Module Name: Aregister
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


module Aregister(
    input CLK,write,
    input [7:0] Bytein,
    output [7:0] Byteout
);

    register register_inst(CLK,write,Bytein,Byteout);
endmodule
