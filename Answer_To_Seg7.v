module Answer_To_Seg7
(input i_Clk,
input [2:0] Answer,
output o_Segment_A,
output o_Segment_B,
output o_Segment_C,
output o_Segment_D,
output o_Segment_E,
output o_Segment_F,
output o_Segment_G);

reg [6:0] r_Hexencoding = 7'h00;




always @(posedge i_Clk)
begin 

	case (Answer)
		4'b0000 : r_Hexencoding <= 7'h00; // Nothing shown 
		4'b0001 : r_Hexencoding <= 7'h3B; // Letter Y
		4'b0010 : r_Hexencoding <= 7'h15; // Letter 
	endcase

end 
// the bit order is ABCDEFG, starting with the MSB. The 8th MSB is not used so A starts at bit 6 
assign o_Segment_A = r_Hexencoding[6];
assign o_Segment_B = r_Hexencoding[5];
assign o_Segment_C = r_Hexencoding[4];
assign o_Segment_D = r_Hexencoding[3];
assign o_Segment_E = r_Hexencoding[2];
assign o_Segment_F = r_Hexencoding[1];
assign o_Segment_G = r_Hexencoding[0];

endmodule 