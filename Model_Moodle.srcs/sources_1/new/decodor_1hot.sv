module decodor_1hot
	(
		input logic [2:0] in,
		output logic [7:0] out 
	);

assign out = 1 << in; 

endmodule