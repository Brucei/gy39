`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 07:37:15
// Design Name: 
// Module Name: top
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


module top(
//input pinA,
//input pinB,
input serial_in,
input read_not_ready_in,
input Byte_ready,
input Load_XMT_datareg,
input T_byte,
input clk,
input rst,
output read_not_ready_out,
output Error1,
output Error2,
output serial_out
    );
    wire [7:0]   serial_connect_databus;
    wire [7:0]   check;
    
    GY39    M1(.Sample_clk(clk),.Serial_in(serial_in),.read_not_ready_in(read_not_ready_in),.rst_b(rst),.check(check),.RCV_datareg(serial_connect_databus),.read_not_ready_out( read_not_ready_out),.Error1(Error1),.Error2( Error2));
    controller  M2(.Data_Bus(serial_connect_databus),.Serial_out(serial_out),.Load_XMT_datareg(Load_XMT_datareg),.Byte_ready(Byte_ready),.T_byte(T_byte),.Clock(clk),.rst_b(rst));
    check   M3(.serial_in(check),.clk(clk),.data_type(data_type));
    sequential_out  M4(.Serial_in(serial_in),.serial_out(serial_connect_databus),.ref_clk(clk));
    
    
endmodule
