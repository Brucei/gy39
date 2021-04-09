`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 21:25:38
// Design Name: 
// Module Name: Datapath_Unit
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


module Datapath_Unit#(parameter    word_size   =   8,
  half_word =   word_size/2,Num_counter_bits  =   4)(
output  reg [word_size-1:0] RCV_datareg,
output                       Ser_in_A5,
                             Ser_in_AA,
                             SC_eq_3,
                             SC_lt_7,
                             BC_eq_8,
input                        Serial_in,
                             clr_Sample_counter,
                             inc_Sample_counter,
                             clr_Bit_counter,
                             inc_Bit_counter,
                             shift,
                             load,
                             Sample_clk,
                             rst_b,
output    wire       [31:0]  light,
output    wire       [15:0]  wendu,
output    wire       [31:0]  qiya,
output    wire       [15:0]  shidu,
output    wire       [15:0]  haiba
    );
    reg       [31:0]  light_1;
    reg       [15:0]  wendu_1;
    reg       [31:0]  qiya_1;
    reg       [15:0]  shidu_1;
    reg       [15:0]  haiba_1;
    reg [word_size-1:0]           RCV_shftreg;
    reg [Num_counter_bits-1:0]    Sample_counter;
    reg [Num_counter_bits:0]      Bit_counter;  
    assign  Ser_in_A5   =   (Serial_in   ==  8'hA5);            //Serial_iconnect   the sequential  Serial_out              
    assign  Ser_in_AA   =   (Serial_in   ==  8'hAA);            //Serial_iconnect   the sequential  Serial_out 
    assign  BC_eq8      =   (Bit_counter    ==  word_size);
    assign  SC_lt_7     =   (Sample_counter <   word_size   -   1);
    assign  SC_eq_3     =   (Sample_counter ==  half_word   -   1);
    always@(posedge Sample_clk)
    if(rst_b    ==  1'b0)begin
    light_1 <=  32'h0000_0000;
    wendu_1 <=  16'h0000;
    qiya_1  <=  32'h0000_0000;
    shidu_1 <=  16'h0000;
    haiba_1 <=  16'h0000;
    Sample_counter  <=  0;
    Bit_counter     <=  0;
    RCV_datareg     <=  0;
    RCV_shftreg     <=  0;
    end
    else    begin
    if(clr_Sample_counter   ==  1)
        Sample_counter  <=  0;
    else  if(inc_Sample_counter   ==  1)
        Sample_counter  <=  Sample_counter  +   1;
          if(clr_Bit_counter    ==  1)
        Bit_counter     <=  0;
    else    if(inc_Bit_counter  ==  1)
        Bit_counter     <=  Bit_counter +1;
        if(shift    ==1)
        RCV_shftreg <=  {Serial_in,RCV_shftreg[word_size-1:1]};
        if(load     ==1)
        RCV_datareg <=  RCV_shftreg;
    end
endmodule
