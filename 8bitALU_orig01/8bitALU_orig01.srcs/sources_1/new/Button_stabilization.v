`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/30 20:07:11
// Design Name: 
// Module Name: Button_stabilization
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


module Button_stabilization(
    input CLK100MHz,
    input button,
    output reg button_delay
        );
        reg [15:0] count;
        always @(posedge CLK100MHz)
        begin
            if(button == 1'b1) begin
                if(count < 16'd9999)
                    count <= count + 1'b1;
                button_delay <= (count == 16'd9999);
            end
            else begin
                count <= 16'd0;
                button_delay <= 1'b0;
            end
        end
        
    endmodule
