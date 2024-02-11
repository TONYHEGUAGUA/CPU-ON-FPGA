`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/24 10:19:28
// Design Name: 
// Module Name: Carry_Flag
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



module Carry_Flag(input [7:0]Reg_a, Reg_b, input [2:0]opcode,input RAM, output reg[7:0]C, output reg Reg_carry,CLK);
    reg cout;
    always@(posedge CLK)begin
        if(opcode == 010) begin //有符号加法
            {cout, C} = Reg_a + Reg_b;
                    Reg_carry = cout;      //进位
        end
        else Reg_carry<=0;
    end
endmodule

