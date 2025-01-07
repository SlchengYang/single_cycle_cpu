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
    input [1:0] choice,      // 2 λѡ���ź�
    input [15:0] in0,        // ���� 0
    input [15:0] in1,        // ���� 1
    input [15:0] in2,        // ���� 2
    input [15:0] in3,        // ���� 3
    output reg [15:0] out    // ���
    );

    // ����ѡ���ź�ѡ������
    always @(*) begin
        case(choice)
            2'b00: out = in0;   // ��ѡ��Ϊ 00 ʱ����� in0
            2'b01: out = in1;   // ��ѡ��Ϊ 01 ʱ����� in1
            2'b10: out = in2;   // ��ѡ��Ϊ 10 ʱ����� in2
            2'b11: out = in3;   // ��ѡ��Ϊ 11 ʱ����� in3
            default: out = 16'b0; // Ĭ�����Ϊ 0
        endcase
    end

endmodule

