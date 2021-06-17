`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:07 03/07/2021 
// Design Name: 
// Module Name:    Fruit-80
// Project Name: 	 Major Project NITK
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module fruit80 (output reg [0:42]lf, output reg [0:36] nf, output reg [0:6]count1=7'b0, input [0:69]iv, input [0:79]k, input clk, rst, output reg h=0, output reg z=0);
reg kt;
reg kt1;
wire [0:4]p,q;
wire [0:3] r;
wire [0:79] iv1;
reg i;

assign iv1 ={1'b1,9'b0,iv[0:69]};
assign f1 =lf[0]^lf[8]^lf[18]^lf[23]^lf[28]^lf[37];
assign nfb = kt^lf[0]^count1[3]^nf[0]^nf[10]^nf[20]^(nf[12]*nf[3])^(nf[14]*nf[25])^(nf[5]*nf[23]*nf[31])^(nf[8]*nf[18]*nf[28]*nf[30]*nf[32]*nf[34]);
assign p = {count1[1],count1[2],count1[3],count1[4],count1[5]};
assign r = {count1[0],count1[1],count1[2],count1[3]};
assign q = {count1[2],count1[3],count1[4],count1[5],count1[6]};

always @(posedge clk)
begin
  if(rst)
  begin
    count1<=7'b0;
  end
  else if (count1==80)
  begin
    count1[0]<=nf[0];
    count1[1]<=nf[1];
    count1[2]<=nf[2];
    count1[3]<=nf[3];
    count1[4]<=nf[4];
    count1[5]<=nf[5];
    count1[6]<=lf[0];
  end
  else
  begin
    count1<=count1+1'b1;
  end
end

always@(posedge clk or posedge rst)
  if(rst)
  begin
    kt<=1'b0;
    kt1<=1'b0;
  end
  else
  begin
    kt<=(k[r]*k[p+16]*k[q+48])^(k[r]*k[p+16])^(k[p+16]*k[q+48])^(k[r]*k[q+48])^k[p+16];
    kt1<=(k[r]*k[p+16])^(k[p+16]*k[p+48])^(k[r]*k[q+48])^k[r]^k[p+16]^k[q+48];
  end

always@(posedge clk)
  if(rst)
  begin
    nf[0:36]<=k[0:36];
    lf[0:42]<=k[37:79];
  end
  else if(count1<=79)
  begin
    nf[0:35]<=nf[1:36];
    nf[36]<=z^iv1[i]^nfb;
    lf[0:41]<=lf[1:42];
    lf[42]<=z^iv1[i]^f1;
  end
  else if(count1==80)
    lf[0]<=1'b1;
  else if(count1>79)
  begin
    nf[0:35]<=nf[1:36];
    nf[36]<=nfb;
    lf[0:41]<=lf[1:42];
    lf[42]<=f1;
  end

always@(posedge clk or posedge rst)
  if(rst)
    i<=1'b0;
  else if(count1<80)
    i<=i+1'b1;

always@(posedge clk or posedge rst)
  if(rst)
    h<=0;
  else
    h<=kt1*(nf[36]^lf[19]^lf[6]*lf[15])^(lf[1]*lf[22])^(nf[35]*lf[27])^(nf[1]*nf[24])^(nf[1]*nf[33]*lf[42]);

always@(posedge clk or posedge rst)
  if(rst)
    z<=0;
  else
    z<=h^nf[0]^nf[7]^^nf[19]^nf[29]^nf[36]^lf[38];
endmodule 
