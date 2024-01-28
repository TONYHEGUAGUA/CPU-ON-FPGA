`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/27 20:13:40
// Design Name: 
// Module Name: dynamic_predictor
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

module dynamic_predictor(
    input CLK,
    input [7:0]instraddr,jumpaddr,
    input [10:0]BHTdata,
    output [7:0]BTA,
    output [1:0]CS,
    output activate
);
    wire [10:0]Poutput;
    assign BTA = Poutput[7:0];
    assign CS = Poutput[9:8];
    assign activate = Poutput[10];
    
    reg [7:0]addr;
    always@(CLK)
    begin
    if(CLK==1)addr<=jumpaddr;
    else addr<=instraddr;//在低电平时，预备好PC寄存器的数值，决定是否要进行跳转
    end
    
    //第一个CLK实际上是是否写入的标识，当为高电平时表示即将写入数据，然后在CLK跳到低电平时，更新数据
    BHT BHT_inst(addr,CLK,~CLK,BHTdata,Poutput);
    
endmodule
