module flopenr(input logic clk,
               input logic reset,
	       input logic enable,
	       input logic d,
               output logic out);
					
	always_ff @(posedge clk, posedge reset)
		if (reset)       out <= 0;
		else if (enable) out <= d;
		
endmodule
