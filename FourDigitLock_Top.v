module FourDigitLock_Top
	(input i_Clk,
	input i_Switch_1,
	input i_Switch_2,
	input i_Switch_3,
	input i_Switch_4,
	output o_LED_1,
	output o_LED_2,
	output o_LED_3,
	output o_LED_4,
	output o_Segment2_A,
	output o_Segment2_B,
	output o_Segment2_C,
	output o_Segment2_D,
	output o_Segment2_E,
	output o_Segment2_F,
	output o_Segment2_G,
	output o_Segment1_A,
	output o_Segment1_B,
	output o_Segment1_C,
	output o_Segment1_D,
	output o_Segment1_E,
	output o_Segment1_F,
	output o_Segment1_G
	);
	
	wire w_Switch_1;
	wire w_Switch_2;
	wire w_Switch_3;
	wire w_Switch_4;
	wire [3:0] w_Binary_Num;
	wire [2:0] w_Answer;
	wire w_Segment1_A;
	wire w_Segment1_B;
	wire w_Segment1_C;
	wire w_Segment1_D;
	wire w_Segment1_E;
	wire w_Segment1_F;
	wire w_Segment1_G;
	
	
	Debounce_Switch Switch_1
	(.i_Clk(i_Clk),
	.i_Switch(i_Switch_1),
	.o_Switch(w_Switch_1));
	
	Debounce_Switch Switch_2
	(.i_Clk(i_Clk),
	.i_Switch(i_Switch_2),
	.o_Switch(w_Switch_2));
	
	Debounce_Switch Switch_3
	(.i_Clk(i_Clk),
	.i_Switch(i_Switch_3),
	.o_Switch(w_Switch_3));
	
	Debounce_Switch Switch_4
	(.i_Clk(i_Clk),
	.i_Switch(i_Switch_3),
	.o_Switch(w_Switch_3));
	
	Seven_Seg_Counter
	(.i_Clk(i_Clk),
	.w_Switch1(w_Switch_1),
	.w_Switch2(w_Switch_2),
	.w_Switch3(w_Switch_3),
	.w_Switch4(w_Switch_4),
	.o_BinaryLED_Count(w_Binary_Num));
	
	FourDigitLock
	(.i_Clk(i_Clk),
	.w_Switch1(w_Switch_1),
	.w_Switch2(w_Switch_2),
	.w_Switch3(w_Switch_3),
	.w_Switch4(w_Switch_4),
	.i_Binary_Num(w_Binary_Num),
	.o_LED_1(o_LED_1),
	.o_LED_2(o_LED_2),
	.o_LED_3(o_LED_3),
	.o_LED_4(o_LED_4),
	.o_Answer(w_Answer));
	
	
 	Binary_To_Seg7 First_Digit
	(.i_Clk(i_Clk),
	.Binary_Num(w_Binary_Num),
	.o_Segment_A(w_Segment2_A),
	.o_Segment_B(w_Segment2_B),
	.o_Segment_C(w_Segment2_C),
	.o_Segment_D(w_Segment2_D),
	.o_Segment_E(w_Segment2_E),
	.o_Segment_F(w_Segment2_F),
	.o_Segment_G(w_Segment2_G));


assign o_Segment2_A = ~w_Segment2_A;
assign o_Segment2_B = ~w_Segment2_B;
assign o_Segment2_C = ~w_Segment2_C;
assign o_Segment2_D = ~w_Segment2_D;
assign o_Segment2_E = ~w_Segment2_E;
assign o_Segment2_F = ~w_Segment2_F;
assign o_Segment2_G = ~w_Segment2_G;
	
	
	Answer_To_Seg7 Second_Digit
	(.i_Clk(i_Clk),
	.Answer(w_Answer[2:0]),
	.o_Segment_A(w_Segment1_A),
	.o_Segment_B(w_Segment1_B),
	.o_Segment_C(w_Segment1_C),
	.o_Segment_D(w_Segment1_D),
	.o_Segment_E(w_Segment1_E),
	.o_Segment_F(w_Segment1_F),
	.o_Segment_G(w_Segment1_G));
 
assign o_Segment1_A = ~w_Segment1_A;
assign o_Segment1_B = ~w_Segment1_B;
assign o_Segment1_C = ~w_Segment1_C;
assign o_Segment1_D = ~w_Segment1_D;
assign o_Segment1_E = ~w_Segment1_E;
assign o_Segment1_F = ~w_Segment1_F;
assign o_Segment1_G = ~w_Segment1_G;

endmodule //FourDigitLock_Top
	