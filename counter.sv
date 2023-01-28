module counter(input wire clk, 
					input wire [1:0] key,
					output wire [7:0] led);
					
reg [31:0] counter;

always @(posedge clk) begin
	if (key[0] == 1'b0)
		counter <= 0;
	else if (key[1] == 1'b1)
		counter <= counter +1;
	else counter <= counter - 1;
end

assign led = counter [27:20];

endmodule