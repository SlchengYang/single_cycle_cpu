`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 18:29:41
// Design Name: 
// Module Name: cpu_sim
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


module CPU_sim(

    );
     reg clk, Reset;
    wire [31:0] currentIAddr, nextIAddr;
    wire [4:0] rs, rt;
    wire [31:0] ReadData1, ReadData2;
    wire [31:0] ALU_result, DataBus;
    
    top_CPU uut(
        .clk(clk),
        .Reset(Reset),
        .currentIAddr(currentIAddr), .nextIAddr(nextIAddr),
        .rs(rs), .rt(rt),
        .ReadData1(ReadData1), .ReadData2(ReadData2),
        .ALU_result(ALU_result), .DataBus(DataBus)
    );
    
    always #50 clk = ~clk;    
    
    initial begin
        clk = 1;
        Reset = 0;
        #25;
        Reset = 1;    
    end
    
endmodule
