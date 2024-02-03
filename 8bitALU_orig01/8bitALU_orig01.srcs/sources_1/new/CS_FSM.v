`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/28 14:03:09
// Design Name: 
// Module Name: CS_FSM
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


module CS_FSM(
    input CLK,
    input activate,
    input jump,
    input [1:0]CS,
    output reg [1:0]New_CS
    );
    always@(posedge CLK)
    begin
        if(activate)
        begin
            if(jump)
            begin
                if(CS==2'b00)New_CS<=2'b01;
                else if(CS==2'b01)New_CS<=2'b10;
                else if(CS==2'b10)New_CS<=2'b11;
                else New_CS<=2'b11;
            end
            else
            begin
                if(CS==2'b11)New_CS<=2'b10;
                else if(CS==2'b10)New_CS<=2'b01;
                else if(CS==2'b01)New_CS<=2'b00;
                else New_CS<=2'b00;
            end
        end
        else
        begin
            if(jump)New_CS<=2'b11;
            else New_CS<=2'b00;
        end
    end
        
endmodule
