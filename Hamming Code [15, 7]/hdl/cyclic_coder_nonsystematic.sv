module cyclic_coder_nonsystematic(
    input logic clk,
    input logic reset,
    input logic enable,
    input logic in,
    output reg out
);

    logic [3:0] s;
    
    always @(posedge clk)
        if (reset)
            s <= 4'd0;
        else if (enable) begin
            s <= { in, s[3:1] };
            out <= in ^ s[1] ^ s[0];
        end
endmodule