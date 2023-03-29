module mult_alpha_gf8(
    input logic clk,
    output logic [2:0] state
);

    initial state = 'b001;
    
    wire feedback = state[1] ^ state[0];
    
    always @(posedge clk) begin
        state[2] <= feedback;
        state[1] <= state[2];
        state[0] <= state[1];
    end
endmodule