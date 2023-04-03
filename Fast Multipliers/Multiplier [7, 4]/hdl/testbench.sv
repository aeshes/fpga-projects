module testbench();
    logic clk;
    logic reset;
    logic in;
    logic out;
    logic [8:0] data = 9'b000110001;
    
    assign in = data[0];
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    always @(posedge clk)
        if (!reset)
            data <= data >> 1;
    
    multiplier m (clk, reset, in, out);
    
    always @(posedge clk)
        if (!reset)
            $write(out);

    initial begin
        reset <= 1'b1;
        @(posedge clk);
        reset <= 1'b0;
        @(posedge clk);
        
        repeat(9) @(posedge clk);
        
        $finish;
    end
endmodule