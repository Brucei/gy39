`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 05:25:41 PM
// Design Name: 
// Module Name: test
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


module test;
reg serial_in;
reg read_not_ready_in;
reg Byte_ready;
reg Load_XMT_datareg;
reg T_byte;
reg clk;
reg rst;
wire read_not_ready_out;
wire Error1;
wire Error2;
wire serial_out;


initial begin
clk =   0;
rst =   1;
serial_in           =  1;
read_not_ready_in   =   0;
Byte_ready          =   0;
Load_XMT_datareg    =   0;
T_byte              =   0;
#5  rst             =  0;
end
always #5 clk=~clk;
    top uut1(
.serial_in(serial_in),
.read_not_ready_in(read_not_ready_in),
.Byte_ready(Byte_ready),
.Load_XMT_datareg(Load_XMT_datareg),
.T_byte(T_byte),
.clk(clk),
.rst(rst),
.read_not_ready_out(read_not_ready_out),
.Error1(Error1),
.Error2(Error2),
.serial_out(serial_out));
  
endmodule
