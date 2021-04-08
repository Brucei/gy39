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


module Control_Unit_0#(parameter
                                one_hot_count   =   3,
                                state_count     =   one_hot_count,
                                size_bit_count  =   3,
                                idle            =3'b001,
                                waiting         =3'b010,
                                sending          =3'b100,
                                all_ones        =9'b1_1111_1111
)(
output  reg                     Load_XMT_DR,
output  reg                     Load_XMT_shftreg,
output  reg                     start,
output  reg                     shift,
output  reg                     clear,
input                           Load_XMT_datareg,
input                           Byte_ready,
input                           T_byte,
input                           BC_lt_BCmax,
input                           Clock,
input                           rst_b
    );
    reg [state_count-1:0]   state,next_state;
    always@(state,Load_XMT_datareg,Byte_ready,T_byte,BC_lt_BCmax)begin:Output_and_next_state
    Load_XMT_DR     =   0;
    Load_XMT_shftreg=   0;
    start           =   0;
    shift           =   0;
    clear           =   0;
    next_state      =   idle;
    case(state)
    idle:   if(Load_XMT_datareg ==  1'b1)begin
    Load_XMT_DR =   1;
    next_state  =idle;
    end
            else if(Byte_ready  ==  1'b1)begin
    Load_XMT_shftreg    =1;
    next_state  =   waiting;
    end
    waiting:if(T_byte   ==  1)begin
    start   =   1;
    next_state  =   sending;
    end
    else  next_state    =   waiting;
    sending:if(BC_lt_BCmax)begin
    shift   =   1;
    next_state  =   sending;
    end
    else    begin
    clear   =   1;
    next_state  =   idle;
    end
    default:  next_state  =   idle;
    endcase
    end
    always@(posedge Clock,negedge rst_b)begin:Start_Transtitons
    if(rst_b    ==  1'b0)state  <=  idle;else   state   <=  next_state;end
endmodule
