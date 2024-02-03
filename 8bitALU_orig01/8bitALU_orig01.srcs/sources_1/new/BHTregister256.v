`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 23:09:07
// Design Name: 
// Module Name: register256
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


module BHTregister256(
    input CLK,
    input [0:255]write,
    input [10:0] Bytein,
    output [0:255][10:0] Byteouts
    );
    genvar i;
    
    generate
    for(i=0;i<256;i=i+1)
    begin
    BHTregister BHTregister_inst(CLK,write[i],Bytein,Byteouts[i]);
    end
    endgenerate
    
endmodule
