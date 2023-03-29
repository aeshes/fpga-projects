module gf16_multiplier_tb();

    logic clk;
    logic [3:0] in;
    logic [3:0] out;
    
    initial forever #5 clk <= !clk;
    
    gf16_multiplier uut(in, out);
    
    initial begin
        clk <= 0;
        in <= '0; #10
        in <= 4'b0111; #10
        in <= 4'b0001; #10
        in <= 4'b0011; #10
        in <= 4'b1010; #10
        in <= '0;
    end
endmodule