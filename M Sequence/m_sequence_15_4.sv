module m_sequence_15_4(
    input logic clock,
    input logic reset,
    output logic out
);

    reg [3:0] state;
    always @(posedge clock)
        if (reset)
            state <= 4'b0011;
        else begin
            state[3] <= state[0];
            state[2] <= state[0] ^ state[3];
            state[1] <= state[2];
            state[0] <= state[1];
        end
        
    assign out = state[0];
    
endmodule