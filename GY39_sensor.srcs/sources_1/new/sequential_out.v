`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/26 08:13:25
// Design Name: 
// Module Name: sequential_out
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


module sequential_out(
input               Serial_in,
output  wire [7:0]  Serial_out,
input                ref_clk
    );   
    reg [7:0]   shift_reg;
    initial begin
    shift_reg   =   8'b0000_0000;
    end
    always@(posedge ref_clk)
        begin
        shift_reg   <=  {shift_reg[6:0],Serial_in};
        end
    assign  Serial_out  =   shift_reg;
    
    
    
    
    
endmodule
