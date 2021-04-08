`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/14 10:43:58
// Design Name: 
// Module Name: GY39
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


module GY39#(parameter  word_size   =   8,half_word =   word_size/2)(
  input                  Sample_clk,
  input                  Serial_in,
  input                  read_not_ready_in,
  input                  rst_b,
 // input  wire  [7:0]  GY_input,    //a series of data
  
  output          [word_size-1:0] RCV_datareg,
  output    wire [word_size-1:0] check,
  output                        read_not_ready_out,
  output                        Error1,
  output                        Error2
  );
  assign  check =    RCV_datareg;
  Control_Unit M0(
  read_not_ready_out,
  Error1,
  Error2,
  clr_Sample_counter,
  inc_Sample_counter,
  clr_Bit_counter,
  inc_Bit_counter,
  shift,
  load,
  read_not_ready_in,
  Ser_in_A5,
  Ser_in_AA,
  SC_eq_3,
  SC_lt_7,
  BC_eq_8,
  Sample_clk,
  rst_b
  );
  
  Datapath_Unit M1(
  RCV_datareg,
  Ser_in_A5,
  Ser_in_AA,
  SC_eq_3,
  SC_lt_7,
  BC_eq_8,
  Serial_in,
  clr_Sample_counter,
  inc_Sample_counter,
  clr_Bit_counter,
  inc_Bit_counter,
  shift,
  load,
  Sample_clk,
  rst_b
  );
 /*
 assign   L[31:24]          =   {GY_input[39:32]<<24};
 assign   L[23:16]          =   {GY_input[47:40]<<16};
 assign   L[15:8]           =   {GY_input[55:48]<<8};
 assign   L[7:0]            =   {GY_input[63:56]};
 */
 /*
 GY_input[7:0]   Byte 0;
 GY_input[15:8]   Byte 1;
 GY_input[23:16]   Byte 2;
 GY_input[31:24]   Byte 3;
 GY_input[39:32]   Byte 4;
 GY_input[47:40]   Byte 5;
 GY_input[55:48]   Byte 6;
 GY_input[63:56]   Byte 7;
 GY_input[71:64]   Byte 8;
 GY_input[79:72]   Byte 9;
 GY_input[87:80]   Byte 10;
 GY_input[95:88]   Byte 11;
 GY_input[103:96]   Byte 12;
 GY_input[111:104]   Byte 13; 

    always@(posedge I2C_clk)
    begin
    if((GY_input[23:16]  ==   8'h15)&&(GY_input[31:24]  ==   8'h04))   
    begin
    light[31:24]    =   GY_input[39:32]<<24;
    light[23:16]    =   GY_input[47:40]<<16 ;
    light[15:8]     =   GY_input[55:48]<<8;
    light[7:0]      =   GY_input[63:56] ;
    end
    else if((GY_input[23:16]  ==   8'h45)&&(GY_input[31:24]  ==   8'h0a))
    begin
    wendu[15:8] =    GY_input[47:40]<<8;
    wendu[7:0]  =    GY_input[39:32];
    qiya[31:24] =    GY_input[79:72]<<24;
    qiya[23:16] =    GY_input[71:64]<<16;
    qiya[15:8]  =    GY_input[63:56]<<8;
    qiya[15:8]  =    GY_input[55:48];
    shidu[15:8] =    GY_input[95:88]<<8;
    shidu[7:0]  =    GY_input[87:80];
    haiba[15:8] =    GY_input[111:104]<<8;
    haiba[7:0]  =    GY_input[103:96]; 
    end
    else if((GY_input[23:16]  ==   8'h55)&&(GY_input[31:24]  ==   8'h01))
    begin
    I2C_ADD_1   <=  I2C_ADD>>1;
    end
end


  - - - - - - -divided algorithm- - - - - - - - calculate the LUX*/ 
   
endmodule
