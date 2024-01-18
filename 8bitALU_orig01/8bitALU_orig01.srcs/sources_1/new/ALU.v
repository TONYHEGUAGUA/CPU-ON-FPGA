`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/07 12:55:01
// Design Name: 
// Module Name: ALU
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


module ALU(
input [2:0]opcode,
input [7:0]Reg_a,Reg_b,RamM,
output reg [7:0]ALUout//delete "sign"
    );
    wire [7:0] sum;
    adder adder_inst(Reg_a,Reg_b,sum);
    always@(*)
        case(opcode)
            3'b000:ALUout = Reg_b;//R1
            3'b001:ALUout = ~Reg_b+1'b1;//-R1
            3'b010:ALUout = sum;//R0+R1
            3'b011:ALUout = Reg_a;//R0
            3'b100:ALUout = RamM;
            3'b101:ALUout = !Reg_a;
            3'b110:ALUout = Reg_a&Reg_b;
            3'b111:ALUout = Reg_a|Reg_b;
        endcase
endmodule

