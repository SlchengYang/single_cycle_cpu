`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:50:03
// Design Name: 
// Module Name: Basys3_cpu
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


module Basys3_CPU(
    input basys3_clock,
    input reset_sw,
    input [1:0] SW_in,
    input next_button,
    output [3:0] enable,
    output [7:0] dispcode
    );
    wire [31:0] currentIAddr, nextIAddr;
    wire [4:0] rs, rt;
    wire [31:0] ReadData1, ReadData2;
    wire [31:0] ALU_result, DataBus;
    wire next_signal;    
    wire [15:0] DisplayData;
    Button_Debounce Button_Debounce(
        .clk(basys3_clock),
        .button(next_button),
        .out_button(next_signal)
    );
    top_CPU top_CPU(
        .clk(next_signal),   
        .Reset(reset_sw),
        .currentIAddr(currentIAddr), .nextIAddr(nextIAddr),
        .rs(rs), .rt(rt),
        .ReadData1(ReadData1), .ReadData2(ReadData2),
        .ALU_result(ALU_result), .DataBus(DataBus)
    );    
    Mux4_16bits Mux4_16bits(
        .choice(SW_in),
        .in0({currentIAddr[7:0], nextIAddr[7:0]}),
        .in1({3'b000, rs, ReadData1[7:0]}),
        .in2({3'b000, rt, ReadData2[7:0]}),
        .in3({ALU_result[7:0], DataBus[7:0]}),
        .out(DisplayData)
    );
     LED LED(
        .clock(basys3_clock),
        .reset(reset_sw),
        .hex3(DisplayData[15:12]),
        .hex2(DisplayData[11:8]),
        .hex1(DisplayData[7:4]),
        .hex0(DisplayData[3:0]),
        .enable(enable),
        .dispcode(dispcode)
    );
    
endmodule

