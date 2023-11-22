	module FourDigitLock
	(input i_Clk,
	input w_Switch1,
	input w_Switch2,
	input w_Switch3,
	input w_Switch4,
	input [3:0] i_Binary_Num,
	output o_LED_1,
	output o_LED_2,
	output o_LED_3,
	output o_LED_4,
	output [2:0] o_Answer
	);
	
	localparam FIRSTDIG 	= 3'b000;
	localparam SECONDDIG 	= 3'b001;
	localparam THIRDDIG 	= 3'b010;
	localparam FOURTHDIG 	= 3'b011;
	localparam CHECK 		= 3'b100;
	localparam g_COUNT_1HZ  = 12500000;
	localparam BLINK 		= 4'b0111;
	reg [3:0] r_SM_Main = 0;
	reg r_LED_1    = 1'b0;
	reg r_Switch_1 = 1'b0;
	reg r_LED_2    = 1'b0;
	reg r_Switch_2 = 1'b0;
	reg r_LED_3    = 1'b0;
	reg r_Switch_3 = 1'b0;
	reg r_LED_4    = 1'b0;
	reg r_Switch_4 = 1'b0;
	reg [15:0] RightPassword = 16'b0001001000110100; //You'll never guess this one 1234
	reg [15:0] CurrentPassword = 0;
	reg [2:0] r_Answer = 3'b000;
	reg [31:0] r_Count_1Hz = 0; 
	reg [3:0] r_Blink_Count = 0;
	
	always @(posedge i_Clk)
	begin 
		
		r_Switch_1 <= w_Switch1;
		r_Switch_2 <= w_Switch2;
		r_Switch_3 <= w_Switch3;
		r_Switch_4 <= w_Switch4;
	
	
		case(r_SM_Main) 
			FIRSTDIG:
			begin 
				r_Blink_Count <= 0;
				r_LED_1 <= 0;
				r_LED_2 <= 0;
				r_LED_3 <= 0;
				r_LED_4 <= 0;
				
				if(w_Switch3 == 1'b1 && r_Switch_3 == 1'b0)
				begin 
					CurrentPassword[15:12] <= i_Binary_Num[3:0];
					r_LED_1 <= 1'b1;
					r_SM_Main <= SECONDDIG;
				end 
				else 
				r_SM_Main <= FIRSTDIG;
				
			end 
			SECONDDIG:
			begin
				if(w_Switch3 == 1'b1 && r_Switch_3 == 1'b0)
				begin 
					CurrentPassword[11:8] <= i_Binary_Num[3:0];
					r_LED_2 <= 1'b1;
					r_SM_Main <= THIRDDIG;
				end 
				else 
				r_SM_Main <= SECONDDIG;			
			
			end 
			THIRDDIG:
			begin 
				if(w_Switch3 == 1'b1 && r_Switch_3 == 1'b0)
					begin 
						CurrentPassword[7:4] <= i_Binary_Num[3:0];
						r_LED_3 <= 1'b1;
						r_SM_Main <= FOURTHDIG;
					end 
					else 
					r_SM_Main <= THIRDDIG;
			end 
			FOURTHDIG:
			begin 
				if(w_Switch3 == 1'b1 && r_Switch_3 == 1'b0)
					begin 
						CurrentPassword[3:0] <= i_Binary_Num[3:0];
						r_LED_4 <= 1'b1;
						r_SM_Main <= CHECK;
					end 
					else 
					r_SM_Main <= FOURTHDIG;			
			end 
			CHECK:
			begin

				if(RightPassword == CurrentPassword)
				begin 
					r_Answer <= 3'b001;
				end 
				else 
				begin 
					r_Answer <= 3'b010;
				end 
				if(r_Blink_Count < BLINK)
				begin 
					if (r_Count_1Hz == g_COUNT_1HZ)
					begin 
					r_LED_1 <= ~r_LED_1;
					r_LED_2 <= ~r_LED_2;
					r_LED_3 <= ~r_LED_3;
					r_LED_4 <= ~r_LED_4;
					r_Count_1Hz <= 0;
					r_Blink_Count <= r_Blink_Count + 1;
					end 
					else 
					r_Count_1Hz <= r_Count_1Hz + 1; 
				end 
				else 
				begin 
				r_SM_Main <= FIRSTDIG;
				end
			end 
		endcase
	end 
	
	assign o_Answer = r_Answer;
	assign o_LED_1 = r_LED_1;
	assign o_LED_2 = r_LED_2;
	assign o_LED_3 = r_LED_3;
	assign o_LED_4 = r_LED_4;
	
	endmodule 