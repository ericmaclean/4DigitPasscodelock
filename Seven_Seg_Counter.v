	module Seven_Seg_Counter
	(input i_Clk,
	input w_Switch1,
	input w_Switch2,
	input w_Switch3,
	input w_Switch4,
	output [3:0] o_BinaryLED_Count
	);
	
	
	reg r_LED_1    = 1'b0;
	reg r_Switch_1 = 1'b0;
	reg r_LED_2    = 1'b0;
	reg r_Switch_2 = 1'b0;
	reg r_LED_3    = 1'b0;
	reg r_Switch_3 = 1'b0;
	reg r_LED_4    = 1'b0;
	reg r_Switch_4 = 1'b0;
	reg [3:0] r_BinaryLED_Count = 4'b0000;

		
	always @(posedge i_Clk)
	begin
	
		r_Switch_1 <= w_Switch1;
		r_Switch_2 <= w_Switch2;
		r_Switch_3 <= w_Switch3;
		r_Switch_4 <= w_Switch4;
	
		if (w_Switch1 == 1'b1 && r_Switch_1 == 1'b0)
		begin
			if (r_BinaryLED_Count > 4'b1000)
			begin
				r_BinaryLED_Count <= 4'b0000;
			end
			else 
			begin
				r_BinaryLED_Count <= r_BinaryLED_Count+1;
			end 
		end
		if(w_Switch2 == 1'b1 && r_Switch_2 == 1'b0)
		begin 
			r_BinaryLED_Count <= 4'b0000;
		end 
		
	end 
	assign o_BinaryLED_Count = r_BinaryLED_Count; 
endmodule 