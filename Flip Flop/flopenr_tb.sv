module flopenr_tb();
    logic clk, reset, enable, d;
    logic out;
    
    flopenr f(clk, reset, enable, d, out);
    
    always #100 clk = ~clk;
    
    initial begin
        clk = 1; reset = 0; enable = 1; d = 0; #100
        clk = 0; reset = 0; enable = 1; d = 1; #100
        clk = 1; reset = 0; enable = 0; d = 0; #100
        clk = 0; reset = 0; enable = 0; d = 1; #100
        clk = 1; reset = 1; enable = 1; d = 1; #100
        clk = 1; reset = 0; enable = 1; d = 1;
    end
endmodule
