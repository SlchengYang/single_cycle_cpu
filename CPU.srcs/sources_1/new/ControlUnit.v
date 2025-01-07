`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:53:12
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [5:0] opcode,
    input [5:0] func,
    input zero,
    input sign,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg RegDst,
    output reg ExtSel,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    
    always @(opcode or zero or sign or func) begin
        case(opcode)
            6'b000000: begin    // R–Õ÷∏¡Ó
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000110010;
                PCSrc[1:0] <= 2'b00;
                if(func==6'b100000)     //add
                    ALUOp[2:0]=3'b000;
                else if(func==6'b100010)    //sub
                    ALUOp[2:0]=3'b001;
                else if(func==6'b100100)    //and
                    ALUOp[2:0]=3'b100;
                else if(func==6'b100101)    //or
                    ALUOp[2:0]=3'b011;
                else if(func==6'b000000)begin    //sll
                    {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b100110010;
                    ALUOp[2:0]=3'b010;
                    end
            end
            6'b001001: begin    // addiu
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b010110001;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_000;
            end
            6'b001100: begin    // andi
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b010110000;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_100;
            end
            6'b001101: begin    // ori
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b010110000;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_011;
            end
            6'b001010: begin    // slti
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b010110001;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_110;
            end
            6'b101011: begin    // sw
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b010010101;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_000;
            end
            6'b100011: begin    // lw
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b011111001;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_000;
            end
            6'b000100: begin    // beq
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000010001;
                PCSrc[1:0] <= (zero==1) ? 2'b01 : 2'b00;
                ALUOp[2:0] <= 3'b001;
            end
            6'b000101: begin    // bne
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000010001;
                PCSrc[1:0] <= (zero==0) ? 2'b01 : 2'b00;
                ALUOp[2:0] <= 3'b001;
            end
            6'b000110: begin    // blez
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000010001;
                PCSrc[1:0] <= (zero==1 || sign==1) ? 2'b01 : 2'b00;
                ALUOp[2:0] <= 3'b001;
            end
            6'b000010: begin    // j
                PCWre <= 1;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000010000;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b10_000;
            end
            6'b111111: begin    // halt
                PCWre <= 0;
                {ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, mRD, mWR, RegDst, ExtSel} <= 9'b000010000;
                {PCSrc[1:0], ALUOp[2:0]} <= 5'b11_000;
            end
        endcase
    end
    
endmodule

