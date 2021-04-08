`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 21:16:01
// Design Name: 
// Module Name: Control_Unit
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
  module Control_Unit#(parameter    word_size   =   112,
  half_word =   word_size/2,Num_state_bits  =   2,
  idle  =   2'b00,starting  =   2'b01,  receiving   =   2'b10)
  (output reg   read_not_ready_out,
                Error1,Error2,
                clr_Sample_counter,
                inc_Sample_counter,
                clr_Bit_counter,
                inc_Bit_counter,
                shift,
                load,
   input        read_not_ready_in,
                Ser_in_A5,
                Ser_in_AA,
                SC_eq_3,
                SC_lt_7,
                BC_eq_8,
                Sample_clk,
                rst_b
);
reg        [word_size-1:0]  RCV_shift_reg;
reg        [Num_state_bits-1:0] state,next_state;
always@(posedge Sample_clk)begin
if(rst_b    ==  1'b0)
state   <=  idle;
else
state   <=  next_state;
end
always@(state,Ser_in_A5,Ser_in_AA,SC_eq_3, SC_lt_7,read_not_ready_in)begin
                read_not_ready_out  =   0;
                clr_Sample_counter  =   0;
                inc_Sample_counter  =   0;
                clr_Bit_counter     =   0;
                inc_Bit_counter     =   0;
                shift               =   0;
                Error1              =   0;
                Error2              =   0;
                load                =   0;
                next_state          =   idle;
                case(state)
                idle:if(Ser_in_A5   ||  Ser_in_AA   ==1'b1)   
                next_state  =   starting;
                else                            
                next_state  =   idle;
                starting:if(Ser_in_A5||Ser_in_AA    ==  1'b0)begin
                next_state  =   idle;
                clr_Sample_counter  =   1;
                end else
                if(SC_eq_3  ==  1'b1)begin
                next_state  =   receiving;
                clr_Sample_counter  =   1;
                end else    begin   inc_Sample_counter  =   1;next_state    =   starting;end
                receiving:if(SC_lt_7    ==  1)begin
                inc_Sample_counter  =   1;
                next_state          =   receiving;
                end
                else    begin
                clr_Sample_counter  =   1;
                if(!BC_eq_8)begin
                shift   =   1;
                inc_Bit_counter =   1;
                next_state  =   receiving;
                end
                else    begin
                next_state          =   idle;
                read_not_ready_out  =   1;
                clr_Bit_counter     =   1;
                if(read_not_ready_in    ==  1'b1)       
                Error1  =   1;
                else    if(Ser_in_A5    ||  Ser_in_AA)  
                Error2  =   1;
                else                    
                load    =   1;        
                end
                end
                default:next_state  =   idle;
                endcase
end
endmodule  
