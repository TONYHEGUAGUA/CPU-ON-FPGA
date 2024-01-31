`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/08 13:23:13
// Design Name: 
// Module Name: ROM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// 0.02 give a tik delay
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ROM(
    input [7:0] addr,
    output reg [7:0] Byteout
);
wire [0:255][7:0] Memory;

    assign Memory[0] = 8'b00000000;//R1=a
    assign Memory[1] = 8'b10100000;//R0=R1
    assign Memory[2] = 8'b00000000;//R1= 0
    assign Memory[3] = 8'b10101000;//R0 = R1 + R0 
    assign Memory[4] = 8'b00001100;//R1 = addr = 12
    assign Memory[5] = 8'b11001100;//M[R1]=R0//addr = 0
    assign Memory[6] = 8'b00000001;//R1 = 1
    assign Memory[7] = 8'b10100000;//R0=R1
    assign Memory[8] = 8'b00001100;//R1 = addr
    assign Memory[9] = 8'b10010000;//R1 = M[R1]
    assign Memory[10] = 8'b11001100;//M[R1] = R0;//a[0]=1
    assign Memory[11] = 8'b00000001;//R1 =1
    assign Memory[12] = 8'b10100000;//R0 = R1
    assign Memory[13] = 8'b00000001;//R1 = 1
    assign Memory[14] = 8'b11001100;//M[R1]=R0;//a[1]=1
    assign Memory[15] = 8'b00001000;//R1= 8
    assign Memory[16] = 8'b10100000;//R0=R1
    assign Memory[17] = 8'b00001010;//R1 = T
    assign Memory[18] = 8'b11001100;//M[R1] = R0;//T =8
    assign Memory[19] = 8'b00000000;//R1= 0
    assign Memory[20] = 8'b10100000;//R0=R1
    assign Memory[21] = 8'b00001011;//R1 = i
    assign Memory[22] = 8'b11001100;//M[R1] = R0;///i=0

    assign Memory[23] = 8'b00001010;//(START)R1 = T
    assign Memory[24] = 8'b10110000;//R0 = M[R1]
    assign Memory[25] = 8'b00001011;//R1 = i
    assign Memory[26] = 8'b10010000;//R1 = M[R1]
    assign Memory[27] = 8'b10000100; // R1 = -R1
    assign Memory[28] = 8'b10101000; // R0 = R1 + R0
    
    assign Memory[29] = 8'b00100101; // d37
    assign Memory[30] = 8'b11101101; // if(R0>0) jump LOOP ; // While i<T:
    assign Memory[31] = 8'b00001001; // (OVER) R1 = 9
    assign Memory[32] = 8'b10110000; // R0 = M[R1]
    assign Memory[33] = 8'b01111111; // R1 = 127
    assign Memory[34] = 8'b11001100; // M[R1] = R0

    assign Memory[35] = 8'b00011111; // d31
    assign Memory[36] = 8'b10000011; // jump OVER
    assign Memory[37] = 8'b00000000; // (LOOP) R1 = a
    assign Memory[38] = 8'b10100000; // R0 = R1
    assign Memory[39] = 8'b00001011; // R1 = i
    assign Memory[40] = 8'b10010000; // R1 = M[R1]
    assign Memory[41] = 8'b10101000; // R0 = R1 + R0
    assign Memory[42] = 8'b00001100; // R1 = addr
    assign Memory[43] = 8'b11001100; // M[R1] = R0; // addr = a+i
    assign Memory[44] = 8'b00000001; // R1 = 1
    assign Memory[45] = 8'b10101000; // R0 = R0 + R1; // R0 = a+i+1
    assign Memory[46] = 8'b00001101; // R1 = addr2 = 13
    assign Memory[47] = 8'b11001100; // M[R1] = R0; // addr2 = a+i+1
    assign Memory[48] = 8'b00000001; // R1 = 1
    assign Memory[49] = 8'b10101000; // R0 = R0 + R1; // R0 = a+i+2
    assign Memory[50] = 8'b00001110; // R1 = addr3 = 14
    assign Memory[51] = 8'b11001100; // M[R1] = R0; // addr3 = a+i+2
    assign Memory[52] = 8'b00001100; // R1 = addr
    assign Memory[53] = 8'b10010000; // R1 = M[R1]
    assign Memory[54] = 8'b10110000; // R0 = M[R1]; // get the value of *(a+i)
    assign Memory[55] = 8'b00001101; // R1 = addr2
    assign Memory[56] = 8'b10010000; // R1 = M[R1]
    assign Memory[57] = 8'b10010000; // R1 = M[R1]; // get the value of *(a+i+1)
    assign Memory[58] = 8'b10101000; // R0 = R0 + R1
    assign Memory[59] = 8'b00001110; // R1 = addr3
    assign Memory[60] = 8'b10010000; // R1 = M[addr3]
    assign Memory[61] = 8'b11001100; // M[R1] = R0; // a[i+2] = a[i]+a[i+1]
    assign Memory[62] = 8'b00001011; // R1 = i
    assign Memory[63] = 8'b10110000; // R0 = M[R1]
    assign Memory[64] = 8'b00000001; // R1 = 1
    assign Memory[65] = 8'b10101000; // R0 = R0 + R1
    assign Memory[66] = 8'b00001011; // R1 = i
    assign Memory[67] = 8'b11001100; // M[R1] = R0; // i = i+1
    assign Memory[68] = 8'b00010111; // d23
    assign Memory[69] = 8'b10000011; // jump START
    // Clear the RAM
    assign Memory[70] = 8'b00001011; // R1 = 11 (MF1)
    assign Memory[71] = 8'b10100000; // R0 = R1 // R0 = 11
    assign Memory[72] = 8'b00001001; // R1 = 0
    assign Memory[73] = 8'b11001100; // M[R1] = R0 // M[0] = 11
    assign Memory[74] = 8'b00001001; // R1 = 0
    assign Memory[75] = 8'b10100000; // R0 = R1 // R0 = 0
    assign Memory[76] = 8'b10010000; // R1 = M[R1] // R1 = M[0]
    assign Memory[77] = 8'b11001100; // M[R1] = R0 
    assign Memory[78] = 8'b00001001; // R1 = 0
    assign Memory[79] = 8'b10110000; // R0 = M[R1] // R0 = M[0]
    assign Memory[80] = 8'b00000001; // R1 = 1
    assign Memory[81] = 8'b10101000; // R0 = R0 + R1
    assign Memory[82] = 8'b00001001; // R1 = 0
    assign Memory[83] = 8'b11001100; // M[R1] = R0 // M[0] += 1
    assign Memory[84] = 8'b01000110; // d70
    assign Memory[85] = 8'b10000011; // jump RETURN
    
    // Show RAM
    assign Memory[86] = 8'b00000000;
    assign Memory[87] = 8'b00000000;
    assign Memory[88] = 8'b00000000;
DMux256bit DMux256bit_inst(Memory, addr, Byteout);

endmodule
