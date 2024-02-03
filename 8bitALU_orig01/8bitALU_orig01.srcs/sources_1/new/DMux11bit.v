`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/03 21:18:30
// Design Name: 
// Module Name: DMux11bit
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


module DMux11bit(
    input [10:0]Memory0,Memory1,
    input switch,
    output reg [10:0]Memoryout
    );
    always@(switch,Memory0,Memory1)
    begin
        if( switch==0 ) Memoryout = Memory0;
        if( switch==1 ) Memoryout = Memory1;
    end
endmodule
