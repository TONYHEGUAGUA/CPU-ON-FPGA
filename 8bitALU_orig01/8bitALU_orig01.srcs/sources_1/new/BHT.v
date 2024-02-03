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
// 0.02 name changed: writeout -> write_enable 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module BHT(
    input [7:0] addr,
    input write, CLK,
    input [10:0] Bytein,
    output [10:0] Byteout
);
    wire [0:255]write_enable;
    wire [0:255][10:0] Memory ;
    
    Mux256way8bit Mux256way8bit_inst(write, addr, write_enable);//wrong module name, should be Mux256way1bit. I will fix this later.
    BHTregister256 BHTregister256_inst(CLK, write_enable, Bytein, Memory);
    DMux256way11bit DMux256way11bit_inst(Memory, addr, Byteout);
    
endmodule
