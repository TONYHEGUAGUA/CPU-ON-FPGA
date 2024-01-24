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



module Carry_Flag(input [7:0]Reg_a, Reg_b, input mode, output reg[7:0]C, output reg Reg_carry,CLK);
    reg cout;
    always@(posedge CLK)begin
        if(mode == 00) begin //�з��żӷ�
            C = Reg_a + Reg_b;
            Reg_carry = ((Reg_a[7] == Reg_b[7]) & (C[7] != Reg_a[7])); //���
        end
        else if(mode == 01) begin //�з��ż���
            C = Reg_a + (~Reg_b) +1'b1;
            Reg_carry = ((Reg_a[7] != Reg_b[7]) & (C[7] != Reg_a[7])); //���
        end
        if(mode == 10) begin //�޷��żӷ�
            {cout, C} = Reg_a + Reg_b;
             Reg_carry = cout;      //��λ
        end
        else if(mode == 11)begin          //�޷��ż���
            {cout, C} = Reg_a + {(~Reg_b)} +1'b1;
             Reg_carry = !cout;     //��λ
        end
    end
endmodule

