module hamming_coder(
    input wire clk,
    input wire enable,
    input wire reset,
    input wire in,
    output wire out
);

reg [3:0] counter = 0;
reg [3:0] state;

wire feedback = state[0] ^ state[2] ^ state[3];
wire nextBit = counter < 5 ? in : feedback;

always @(posedge clk) begin
    if (reset) begin
        state <= 0;
        counter <= 0;
    end
    else
        if (enable) begin
            state <= { nextBit, state[3:1] };
            counter <= counter + 4'b0001;
        end
end

assign out = state[0];

endmodule
