`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/10 10:57:42
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
    reg CLK3Hz,PROGRAM;
    wire[7:0]instr,instraddr,ARegout,BRegout,MRegout;
    wire [2:0]opcode;
    wire PCwrite;
    
    computer computer_inst(
    .CLK3Hz(CLK3Hz),
    .PROGRAM2(PROGRAM),
    .instr(instr),
    .MRegout(MRegout),
    .instraddr(instraddr),
    .Reg_b(BRegout),
    .Reg_a(ARegout),
    .opcode(opcode),
    .PCwrite(PCwrite)
    );
    
    initial
    begin
    CLK3Hz = 0;
    PROGRAM = 0;
   
    #10 PROGRAM =1;
    end
    always
    begin
    #1 CLK3Hz = ~CLK3Hz;
    end
endmodule
