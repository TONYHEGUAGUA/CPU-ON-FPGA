`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 17:24:05
// Design Name: 
// Module Name: counter
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

module counter(clk,cnt);
input clk;
output reg [1:0] cnt = 0;
always@(posedge clk) begin
if(cnt == 2'b11)
cnt <= 2'b00;
else
cnt <= cnt + 1'b1;
end
endmodule

