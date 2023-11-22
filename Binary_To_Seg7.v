module Binary_To_Seg7
(input i_Clk,
input [3:0] Binary_Num,
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

	case (Binary_Num)
		4'b0000 : r_Hexencoding <= 7'h7E; // 7E in hex = 0111 1110 which is the segment display for 0 
		4'b0001 : r_Hexencoding <= 7'h30; // number 1
		4'b0010 : r_Hexencoding <= 7'h6D; // number 2
		4'b0011 : r_Hexencoding <= 7'h79; // number 3
		4'b0100 : r_Hexencoding <= 7'h33; // number 4
		4'b0101 : r_Hexencoding <= 7'h5B; // number 5
		4'b0110 : r_Hexencoding <= 7'h5F; // number 6
		4'b0111 : r_Hexencoding <= 7'h70; // number 7
		4'b1000 : r_Hexencoding <= 7'h7F; // number 8
		4'b1001 : r_Hexencoding <= 7'h7B; // number 9
		4'b1010 : r_Hexencoding <= 7'h77; // number A
		4'b1011 : r_Hexencoding <= 7'h1F; // number B
		4'b1100 : r_Hexencoding <= 7'h4E; // number C
		4'b1101 : r_Hexencoding <= 7'h3D; // number D
		4'b1110 : r_Hexencoding <= 7'h4F; // number E
		4'b1111 : r_Hexencoding <= 7'h47; // number F
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