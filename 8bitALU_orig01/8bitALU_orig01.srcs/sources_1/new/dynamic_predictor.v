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
    input [7:0]instraddr,jumpaddr,//jumpcode����תָ���ROM��ַ
    input [2:0]BHTdata,//{activate,CS}
    input [7:0]TBA,//BHT which is prepared to be stored in BHT //regB actually
    output [7:0]BTA,
    output [1:0]CS,
    output activate
);
    wire [10:0]Poutput;
    assign BTA = Poutput[7:0];
    //assign CS = Poutput[9:8];
    assign CS = 2'b11;
    //assign activate = Poutput[10];
    assign activate = 1'b1;
    
    reg [7:0]addr;
    always@(*)
    begin
    if(CLK==1)addr=jumpaddr;
    else addr=instraddr;//�ڵ͵�ƽʱ��Ԥ����PC�Ĵ�������ֵ�������Ƿ�Ҫ������ת
    end
    
    //��һ��CLKʵ�������Ƿ�д��ı�ʶ����Ϊ�ߵ�ƽʱ��ʾ����д�����ݣ�Ȼ����CLK�����͵�ƽʱ����������
    BHT BHT_inst(addr,CLK,~CLK,{BHTdata,TBA},Poutput);
    //BHT BHT_inst(addr,CLK,~CLK,{3'b111,TBA},Poutput);
    
endmodule
