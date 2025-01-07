`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 17:21:37
// Design Name: 
// Module Name: Mux4_16bits
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


module Mux4_16bits(
    input [1:0] choice,      // 2 位选择信号
    input [15:0] in0,        // 输入 0
    input [15:0] in1,        // 输入 1
    input [15:0] in2,        // 输入 2
    input [15:0] in3,        // 输入 3
    output reg [15:0] out    // 输出
    );

    // 根据选择信号选择输入
    always @(*) begin
        case(choice)
            2'b00: out = in0;   // 当选择为 00 时，输出 in0
            2'b01: out = in1;   // 当选择为 01 时，输出 in1
            2'b10: out = in2;   // 当选择为 10 时，输出 in2
            2'b11: out = in3;   // 当选择为 11 时，输出 in3
            default: out = 16'b0; // 默认输出为 0
        endcase
    end

endmodule

