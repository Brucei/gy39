`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 09:20:58 PM
// Design Name: 
// Module Name: check
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


module check(
input   [7:0]   serial_in,      //zhentou
input           clk,
//output  [111:0] serial_out,
output reg  [7:0]   data_type

    );
    /*
    reg_file[0]             5A
    reg_file[1]             5A
    reg_file[2]             15/45/55
    reg_file[3]             data_num
    reg_file[4]             before_high_8
    reg_file[5]             before_low_8
    reg_file[6]             after_high_8
    reg_file[7]             after_low_8
    reg_file[8]
    reg_file[9]
    reg_file[10]
    reg_file[11]
    reg_file[12] 
    reg_file[12]            
    */
    reg [7:0]   command;
    reg [31:0]  LUX;
    reg [15:0]  temp;
    reg [31:0]  qiya;
    reg [15:0]  shidu;
    reg [7:0]   haiba;
    reg [7:0]   reg_file  [13:0];
    always@(posedge clk)begin
    reg_file[0] =   8'h5a;
    reg_file[1] =   8'h5a;
    if(serial_in    ==  8'ha5)begin          //for the use of 
    if(command      ==  8'h51)begin
    data_type   =   8'h15;
    if(reg_file[2]  ==  8'h15)begin
        reg_file[3] =   8'h04;
        LUX[31:24]  =   reg_file[4]<<24;
        LUX[23:16]  =   reg_file[5]<<16;
        LUX[15:8]   =   reg_file[6]<<8;
        LUX[7:0]    =   reg_file[7];
    end
    else if(reg_file[2] ==  8'h45)begin
        reg_file[3] =   8'h0a;
        temp[15:8]  =   reg_file[4]<<8;
        temp[7:0]   =   reg_file[5];
        qiya[31:24] =   reg_file[6]<<24;
        qiya[23:16] =   reg_file[7]<<16;
        qiya[15:8]  =   reg_file[8]<<8;
        qiya[7:0]   =   reg_file[9];
        shidu[15:8] =   reg_file[10]<<8;
        shidu[7:0]  =   reg_file[11];
        haiba[15:8] =   reg_file[12]<<8;
        haiba[7:0]  =   reg_file[13];
    end
    end
        else if (command      ==  8'h52)begin
        data_type   =   8'h45;
        end
    end
    end
endmodule
