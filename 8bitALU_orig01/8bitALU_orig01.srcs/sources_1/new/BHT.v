`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 10:33:12
// Design Name: 
// Module Name: RAM
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
module BHT(
    input [7:0] addr,
    input write, CLK,
    input [10:0] Bytein,
    output [10:0] Byteout
);
    wire [0:255]writeout;
    wire [0:255][10:0] Memory ;
    
    Mux256bit Mux256bit_inst(write, addr, writeout);
    BHTregister256 BHTregister256_inst(CLK, writeout, Bytein, Memory);
    DMux256bit DMux256bit_inst(Memory, addr, Byteout);
    
endmodule
