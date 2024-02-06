// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Wed Jun 14 21:35:44 2023"

module Datapath(
	clk,
	reset,
	PCSrc,
	RegWrite,
	ALUSrc,
	MemWrite,
	MemToReg,
	ALUControl,
	ImmSrc,
	PCPrediction,
	RegSrc,
	N,
	Z,
	C,
	V,
	AluOutM,
	Cond,
	Funct,
	Op,
	PC,
	Rd
);


input wire	clk;
input wire	reset;
input wire	PCSrc;
input wire	RegWrite;
input wire	ALUSrc;
input wire	MemWrite;
input wire	MemToReg;
input wire	[3:0] ALUControl;
input wire	[1:0] ImmSrc;
input wire	[31:0] PCPrediction;
input wire	[1:0] RegSrc;
output wire	N;
output wire	Z;
output wire	C;
output wire	V;
output wire	[31:0] AluOutM;
output wire	[3:0] Cond;
output wire	[5:0] Funct;
output wire	[1:0] Op;
output wire	[31:0] PC;
output wire	[3:0] Rd;

wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[23:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[3:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
wire	[3:0] SYNTHESIZED_WIRE_26;
wire	[3:0] SYNTHESIZED_WIRE_27;
wire	[3:0] SYNTHESIZED_WIRE_29;
wire	[3:0] SYNTHESIZED_WIRE_30;
wire	[3:0] SYNTHESIZED_WIRE_31;
wire	[3:0] SYNTHESIZED_WIRE_32;

assign	AluOutM = SYNTHESIZED_WIRE_35;
assign	PC = SYNTHESIZED_WIRE_34;
assign	Rd = SYNTHESIZED_WIRE_38;




Constant0	b2v_inst(
	.out(SYNTHESIZED_WIRE_9));


IMem	b2v_inst1(
	.ADDR(SYNTHESIZED_WIRE_34),
	.RD(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst1.ADDR_WIDTH = 32;
	defparam	b2v_inst1.BYTE_SIZE = 4;


Adder	b2v_inst10(
	.DATA_A(SYNTHESIZED_WIRE_34),
	.DATA_B(SYNTHESIZED_WIRE_2)
	);
	defparam	b2v_inst10.WIDTH = 32;


Constant4	b2v_inst12(
	.out(SYNTHESIZED_WIRE_2));


DP_WB	b2v_inst13(
	.clk(clk),
	.reset(reset),
	.ALUOutM(SYNTHESIZED_WIRE_35),
	.RD(SYNTHESIZED_WIRE_4),
	.WA3M(SYNTHESIZED_WIRE_5),
	.ALUOutW(SYNTHESIZED_WIRE_15),
	.ReadDataW(SYNTHESIZED_WIRE_16),
	.WA3W(SYNTHESIZED_WIRE_29));


Extender	b2v_inst14(
	.A(SYNTHESIZED_WIRE_6),
	.select(ImmSrc),
	.Q(SYNTHESIZED_WIRE_19));


Mux_2to1	b2v_inst15(
	.select(ALUSrc),
	.input_0(SYNTHESIZED_WIRE_36),
	.input_1(SYNTHESIZED_WIRE_8),
	.output_value(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst15.WIDTH = 32;


ALU	b2v_inst16(
	.CI(SYNTHESIZED_WIRE_9),
	.control(ALUControl),
	.DATA_A(SYNTHESIZED_WIRE_10),
	.DATA_B(SYNTHESIZED_WIRE_11),
	.CO(C),
	.OVF(V),
	.N(N),
	.Z(Z),
	.OUT(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst16.WIDTH = 32;


DMem	b2v_inst18(
	.clk(clk),
	.WE(MemWrite),
	.ADDR(SYNTHESIZED_WIRE_35),
	.WD(SYNTHESIZED_WIRE_13),
	.RD(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst18.ADDR_WIDTH = 32;
	defparam	b2v_inst18.BYTE_SIZE = 4;


DP_IF	b2v_inst2(
	.clk(clk),
	.reset(reset),
	.PC(SYNTHESIZED_WIRE_14),
	.PCF(SYNTHESIZED_WIRE_34));


Mux_2to1	b2v_inst21(
	.select(MemToReg),
	.input_0(SYNTHESIZED_WIRE_15),
	.input_1(SYNTHESIZED_WIRE_16),
	.output_value(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst21.WIDTH = 32;


Constant15	b2v_inst23(
	.out(SYNTHESIZED_WIRE_27));


DP_ID	b2v_inst3(
	.clk(clk),
	.reset(reset),
	.InstrF(SYNTHESIZED_WIRE_17),
	.Cond(Cond),
	.Funct(Funct),
	.Inst23(SYNTHESIZED_WIRE_6),
	.Op(Op),
	.Rd(SYNTHESIZED_WIRE_38),
	.Rm(SYNTHESIZED_WIRE_32),
	.Rn(SYNTHESIZED_WIRE_26));


Mux_2to1	b2v_inst4(
	.select(PCSrc),
	.input_0(PCPrediction),
	.input_1(SYNTHESIZED_WIRE_37),
	.output_value(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst4.WIDTH = 32;


DP_EX	b2v_inst5(
	.clk(clk),
	.reset(reset),
	.ExtImm(SYNTHESIZED_WIRE_19),
	.RD1(SYNTHESIZED_WIRE_20),
	.RD2(SYNTHESIZED_WIRE_21),
	.WA3D(SYNTHESIZED_WIRE_38),
	.ExtImmE(SYNTHESIZED_WIRE_8),
	.SrcAE(SYNTHESIZED_WIRE_10),
	.WA3E(SYNTHESIZED_WIRE_24),
	.WriteDataE(SYNTHESIZED_WIRE_36));


DP_MEM	b2v_inst6(
	.clk(clk),
	.reset(reset),
	.ALUResultE(SYNTHESIZED_WIRE_23),
	.WA3E(SYNTHESIZED_WIRE_24),
	.WriteDataE(SYNTHESIZED_WIRE_36),
	.A(SYNTHESIZED_WIRE_35),
	.WA3M(SYNTHESIZED_WIRE_5),
	.WD(SYNTHESIZED_WIRE_13));


Mux_2to1	b2v_inst7(
	.select(RegSrc[0]),
	.input_0(SYNTHESIZED_WIRE_26),
	.input_1(SYNTHESIZED_WIRE_27),
	.output_value(SYNTHESIZED_WIRE_30));
	defparam	b2v_inst7.WIDTH = 4;


Register_file	b2v_inst8(
	.clk(clk),
	.write_enable(RegWrite),
	.reset(reset),
	.DATA(SYNTHESIZED_WIRE_37),
	.Destination_select(SYNTHESIZED_WIRE_29),
	.Reg_15(PCPrediction),
	.Source_select_0(SYNTHESIZED_WIRE_30),
	.Source_select_1(SYNTHESIZED_WIRE_31),
	.out_0(SYNTHESIZED_WIRE_20),
	.out_1(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst8.WIDTH = 32;


Mux_2to1	b2v_inst9(
	.select(RegSrc[1]),
	.input_0(SYNTHESIZED_WIRE_32),
	.input_1(SYNTHESIZED_WIRE_38),
	.output_value(SYNTHESIZED_WIRE_31));
	defparam	b2v_inst9.WIDTH = 4;


endmodule
