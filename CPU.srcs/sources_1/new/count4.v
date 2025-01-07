`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:53:51
// Design Name: 
// Module Name: count4
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


module count4(
    input clk,
    output reg [1:0] count
    );
    
    always @(posedge clk) begin
        if(count == 2'b11) count <= 0;
        else count <= count + 1;
    end
endmodule

