`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 07:30:35
// Design Name: 
// Module Name: controller
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


module controller#(parameter    word_size   =   8)(
output                  Serial_out,
input   [word_size-1:0] Data_Bus,
input                   Load_XMT_datareg,
                        Byte_ready,
                        T_byte,
                        Clock,
                        rst_b);
                        /*      
input sys_clk,
input   [23:0] series,
input   [6:0]  I2C_ADD,
output  reg [23:0] series_out,                          //  TBD
output  reg [7:0]  I2C_ADD_OUT,
output  reg wendu_en,
output  reg qiya_en,
output  reg shidu_en,
output  reg haiba_en,
output  reg light_en
    );
    */
    
    Control_Unit_0  M0(
    Load_XMT_DR,Load_XMT_shiftreg,start,shift,clear,Load_XMT_datareg,Byte_ready,T_byte,BC_LT_BCmax,Clock,rst_b
    );
    Datapath_Unit_0 M1(
    Serial_out,BC_lt_BCmax,Data_Bus,Load_XMT_DR,Load_XMT_shftreg,start,shift,clear,Clock,rst_b
    );
    endmodule
    /*
    reg [7:0] sum;
  //  assign series[23:16]    =   8'ha5;   //bit7;
    reg [17:0] baud;
    
   
    series[7:0]     //sum;          
    series[15:8]    //command;
    seires[23:16]   //zhentou
    
   
    always  @(posedge sys_clk)begin
    if((series[23:8]    ==  16'ha581)&&(series[7:0]    ==  8'h26))begin                 //saved value when power off
    wendu_en   <=  1;
    qiya_en    <=  1;
    shidu_en   <=  1;
    haiba_en   <=  1;
    light_en   <=  0; 
    end
    else if(series[23:8]    ==  16'ha582&&(series[7:0]    ==  8'h27))begin               //saved value when power off
    light_en   <=  1;
    wendu_en   <=  0;
    qiya_en    <=  0;
    shidu_en   <=  0;
    haiba_en   <=  0;
    end
    else if(series[23:8]    ==  16'ha551&&(series[7:0]    ==  8'hf6))begin                  //Don't save value when power off
     light_en   <=  1;
     wendu_en   <=  0;
     qiya_en    <=  0;
     shidu_en   <=  0;
     haiba_en   <=  0;
    end
    else if(series[23:8]    ==  16'ha552&&(series[7:0]    ==  8'hf7))begin                  //Don't save value when power off
    wendu_en   <=  1;
    qiya_en    <=  1;
    shidu_en   <=  1;
    haiba_en   <=  1;
    light_en   <=  0; 
    end
    else if((series[23:8]    ==  16'ha5ae)&&(series[7:0]    ==  8'h53))begin                //set baud  =   9600
    baud    <=  18'd9600;
    end
    else if((series[23:8]    ==  16'ha5ae)&&(series[7:0]    ==  8'h54))begin                //set baud  =   115200
    baud    <=  18'd115200;
    end
    else if(series[23:16]    ==  16'haa)begin                                              //set I2C_ADDR,saved I2C_ADDR_OUT when power off
    I2C_ADD_OUT <=  I2C_ADD<<1;
    
    end
    
    end
   
    
    
    
    
endmodule
*/