`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:18 03/10/2022
// Design Name:   Pipeline_Test
// Module Name:   /home/ise/ADLD_6TH/Test_car_parking_new.v
// Project Name:  ADLD_6TH
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Car_Parking
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Pipeline;

wire [15:0] Z;

reg [3:0] rs1,rs2,rd,func;

reg [7:0] addr;

reg clkl,clk2;

integer k;

//Pipeline Test Bench

PIpeline_Assign MYPIPE (.rs1(rs1),.rs2(rs2),.rd(rd),.func(func),.addr(addr),.clk1(clk1),.clk2(clk2),.Z(Zout));

initial begin

clk1 = 0; 
clk2 = 0;

// Generating two-phase clock

repeat (20) 
begin

#5 clk1=1; #5 clk1=0;

#5 clk2=1; #5 clk2=0;

end

end

initial

for (k=0; k<16; k=k+1)

MYPIPE.regbank[k]=k;// Initialize registers


initial begin

#5 rs1=3; rs2=5; rd=10; func=0; addr=125;// ADD

#20 rs1=3; rs2=8; rd=12;func=2;addr=126;// MUL

#20 rs1=10; rs2=5; rd=14; func=1; addr=128;// SUB

#20 rsl=7; rs2=3; rd=13; func=11; addr=127;// SLA 

#20 rs1=10; rs2=5; rd=15; func=1; addr=129; //SUB

#20 rs1=12; rs2=13; rd=16; func=0; addr=130; //SUB


#60 for (k=125; k<131; k=k+1)

$display ("Mem [%3d]=%3d", k, MYPIPE.mem[k]);

end
initial

begin

$dumpfile ("pipe2.vcd");

$dumpvars (0, pipe2_test);

$monitor ("Time: %3d, F =%3d", $time,Z);

#300 $finish;

end


endmodule