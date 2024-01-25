`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/25 17:03:43
// Design Name: 
// Module Name: display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// when ina[1]is 1,debug mode [PC,RegB,Memory]
// when ina[1]is 0,normal mode [mem[253],mem[254],mem[255]]
// when ina[2]is 1,change PC to RegA.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display(
    input CLK100MHz,
    input [3:0]ina,
    input [7:0]instraddr,Reg_a,Reg_b,RamM,
    input [0:2][7:0]ramdisplay,
    output [7:0]MRegout,
    output [7:0]Regout,
    output [3:0]Regsel
    );

    reg [7:0]input0,input1,input2;
    always@(*)
    begin
        if(ina[1]==1)
        begin
            if(ina[2]==1)input0 = Reg_a;
            else input0 = instraddr;
            input1 = Reg_b;
            input2 = RamM;
        end
        else
        begin
            input0 = ramdisplay[0];
            input1 = ramdisplay[1];
            input2 = ramdisplay[2];
        end
    end
    
    seg_led seg_led_inst(CLK100MHz,input0,input1,Regsel,Regout);// Show regA and Reg_b
    assign MRegout = input2;//Show regM
endmodule
