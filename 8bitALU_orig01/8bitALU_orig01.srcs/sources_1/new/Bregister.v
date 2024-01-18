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
    input [7:0]regBtransmit,
    input [7:0]seg,
    output [7:0] Byteout
);
    reg [7:0]Bytein;
    reg write;
    always @(*) begin
    if (regBtransmit[7] == 0)
        begin
        Bytein = regBtransmit;
        write = 1;
        end
    else
        begin
        Bytein = seg;
        write = Bwrite;
        end
    end
    register register_inst(CLK,write,Bytein,Byteout);
endmodule
