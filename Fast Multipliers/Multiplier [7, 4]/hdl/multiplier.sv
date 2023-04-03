module multiplier(
    input logic clk,
    input logic reset,
    input logic in,
    output logic out
);

    logic [2:0] s;
    
    always @(posedge clk)
        if (reset)
            s <= '0;
        else
            s <= { in, s[2:1] };
        
    assign out = in ^ s[2] ^ s[0];
endmodule