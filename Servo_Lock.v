module Servo_Lock 
(input i_Clk, 
input Answer, 
output io_PMOD_4);
						//500,000 = 20ms @25Mhz
reg [19:0] Counter = 0; //2^19 = 524288 minimum for counting to 500,000
reg Servo_reg = 0;

always @(posedge i_Clk)
begin 
	if (Answer == 2'b01)
	begin 
		Counter <= Counter + 1;	//correct answer, open latch
		if(Counter == 'd499999) //Counter is counting up to 20ms by cycling through 0-499,999
			Counter <= 0;
		if(Counter < 'd62000) //high position is set by this (2.48ms = 62,000 @25Mhz)
			Servo_reg <= 1'b1;			  
		else 
			Servo_reg <= 1'b0;
	end 
	else 
	begin 
		Counter <= Counter + 1;	//default or wrong asnwer keep latch closed 
		if(Counter == 'd499999) //Counter is counting up to 20ms by cycling through 0-499,999
			Counter <= 0;
		if(Counter < 'd17000) //low position is set by this (.68ms = 17,000 @25Mhz)
			Servo_reg <= 1'b1;			  
		else 
			Servo_reg <= 1'b0;
	end 
end 

assign io_PMOD_4 = Servo_reg;

endmodule 