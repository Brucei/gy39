`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 18:53:00
// Design Name: 
// Module Name: Control_Unit_0
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


module Datapath_Unit_0#(parameter
word_size   =   8,
size_bit_count  =   3,
all_ones    =   {(word_size+1){1'b1}}
)(
output  Serial_out,
        BC_lt_BCmax,
input   [word_size-1:0] Data_Bus,
input                   Load_XMT_DR,
input                   Load_XMT_shftreg,
input                   start,
input                   shift,
input                   clear,
input                   Clock,
input                   rst_b
    );
    reg [word_size-1:0]     XMT_datareg;
    reg [word_size:0]       XMT_shftreg;
    reg [size_bit_count:0]  bit_count;
    assign  Serial_out  =   XMT_shftreg[0];
    assign  BC_lt_BCmax =   (bit_count<word_size+1);
    always@(posedge Clock,negedge   rst_b)
    if(rst_b    ==  1'b0)begin
    XMT_shftreg <=  all_ones;
    bit_count   <=0;
    end
    else begin:Register_Transfer
    if(Load_XMT_DR  ==  1'b1)   XMT_datareg  <=  Data_Bus;
    if(Load_XMT_shftreg ==  1'b1)
        XMT_shftreg <=  {XMT_datareg,1'b1};
    if(start    ==  1'b1)   XMT_shftreg[0]  <=0;
    if(clear    ==  1'b1)   bit_count       <=0;
    if(shift    ==  1'b1)begin
    XMT_shftreg <=  {1'b1,XMT_shftreg[word_size-1:0]};
    bit_count   <=  bit_count   +   1;
    end
    end
endmodule
