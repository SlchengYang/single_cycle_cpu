`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 16:58:57
// Design Name: 
// Module Name: LED
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


module LED(
    input clock,
    input reset,
    input [3:0] hex0,
    input [3:0] hex1,
    input [3:0] hex2,
    input [3:0] hex3,
    output reg [3:0] enable,
    output [7:0] dispcode 
    );
    wire [3:0] hex_num;    
    integer n;
    
    initial begin
        n=0;
        enable =4'b0111;
    end

    Mux4 Mux4(
    .choice(enable),
    .in0(hex0),.in1(hex1),.in2(hex2),.in3(hex3),
    .out(hex_num)
    );
    Hex_To_7seg Hex_To_7seg(
    .hex(hex_num),
    .dispcode(dispcode)
    );
    always @(posedge clock or negedge reset) begin
         if(reset==0)begin
            n=0;
            enable=4'b0111;
         end
         else begin
             if(n<50000) n=n+1;
             else begin
                n=0;
                case(enable)
                    4'b0111: enable=4'b1011;
                    4'b1011: enable=4'b1101;
                    4'b1101: enable=4'b1110;
                    4'b1110: enable=4'b0111; 
                endcase
             end
         end
    end
endmodule

