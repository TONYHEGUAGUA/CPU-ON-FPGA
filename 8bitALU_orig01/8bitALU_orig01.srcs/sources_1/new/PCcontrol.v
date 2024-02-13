`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/16 10:30:55
// Design Name: 
// Module Name: PCcontrol
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: PCcontrol ��һ����ʱ��������ˮ�ߵ�"ִ��"ͬ���Ŀ����������Ĺ�����1����׼R1��ֵ��PC�Ĵ�����
//2��������һ���ڵ�"ȡָ""����""ִ��"����
// 3��ע�⣺д�ز�������Ҫ���ء�
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
//0.02 - bug fixed: PCwrite register will be flushed too.
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PCcontrol(
    input CLK,
    input activate,
    input [1:0]CS,
    input [1:0]jumpcode,
    input [7:0]ALUout,
    output reg [2:0] BHTdata,
    output reg PCwrite,PCtraceback
    ); 
   
    
    wire jump;//whether jump or not
    //assign jump=(jumpcode[1]&~ALUout[7]&~ALUout[6]&~ALUout[5]&~ALUout[4]&~ALUout[3]&~ALUout[2]&~ALUout[1]&~ALUout[0])|(jumpcode[0]&~ALUout[7]&(ALUout[6]|ALUout[5]|ALUout[4]|ALUout[3]|ALUout[2]|ALUout[1]|ALUout[0]))|(jumpcode[1]&jumpcode[0]);
    assign jump=~PCwrite&(jumpcode[1]&~ALUout[7]&~ALUout[6]&~ALUout[5]&~ALUout[4]&~ALUout[3]&~ALUout[2]&~ALUout[1]&~ALUout[0])|(jumpcode[0]&~ALUout[7]&(ALUout[6]|ALUout[5]|ALUout[4]|ALUout[3]|ALUout[2]|ALUout[1]|ALUout[0]))|(jumpcode[1]&jumpcode[0]);
    reg [1:0]activate_delay;
    reg [1:0][1:0]CS_delay;
    always @(posedge CLK)
    begin
        activate_delay[0] <= activate;
        activate_delay[1] <= activate_delay[0];//�������ӳ�
        CS_delay[0]<=CS;
        CS_delay[1]<=CS_delay[0];
        PCwrite <= (~activate_delay[1]&jump)|(activate_delay[1]&CS_delay[1][1]&~jump)|(activate_delay[1]&~CS_delay[1][1]&jump)?1:0;//when it's different,meaning predicting wrong.
        PCtraceback <= activate_delay[1]&CS_delay[1][1]&~jump;//��̬Ԥ���Ѽ���ҷ�������ת������ʵ���ϲ���Ҫ��תʱΪ1
        //�������Σ���Ԥ����Ԥ����ת��ʵ��ȷʵ��ת��
        //��Ԥ����Ԥ�ⲻ��ת��ʵ��ȷʵ����ת��
        //��Ԥ����Ԥ�ⲻ��ת��ʵ����ת��
        //��Ԥ����Ԥ����ת��ʵ�ʲ���ת��
        //һ���������ֻ��ҪPCwriteΪ0���ɡ��������PCwrite��Ҫ���룬����������Ƚϸ��ӣ���Ҫ��PC�Ĵ������ݵ���תǰ��
        //when ~activate_delay[1]&jump, just make PC=regB.
        //But when activate_delay[1]&~jump, return traceback.
        
        BHTdata[2]<= jumpcode[1]|jumpcode[0];
    end
    CS_FSM CS_FSM_inst(CLK,activate_delay[1],jump,CS_delay[1],BHTdata[1:0]);
endmodule
