module prescaler(
    input logic clk,
    output logic out
);

    parameter counter_max = 1250;
    parameter counter_bits = 11;
    
    logic [counter_bits-1:0] divider;
    
    always_ff @(posedge clk) begin
        if (divider == counter_max) begin
            divider <= 0;
            out     <= 1;
        end
        else begin
            divider <= divider + 1;
            out     <= 0;
        end
    end
endmodule
