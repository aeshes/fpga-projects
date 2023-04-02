module cyclic_coder_nonsystematic(
    input logic clk,
    input logic reset,
    input logic enable,
    input logic in,
    output reg out
);

    logic [3:0] s;
    
    always @(posedge clk) begin
        if (reset)
            s <= '0;
        else if (enable)
            s <= { in, s[3:1] };
    end
    
    assign out = in ^ s[1] ^ s[0];
endmodule