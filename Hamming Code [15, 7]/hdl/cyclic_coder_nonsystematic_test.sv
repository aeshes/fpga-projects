module cyclic_coder_nonsystematic_test();

    logic clock;
    logic reset;
    logic [15:0] data = 16'b0000011000000001;
    logic enable;
    logic in;
    logic out;
    
    assign in = data[0];
    
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end
    
    always @(posedge clock)
        if (!reset && enable)
            data <= data >> 1;
        
    cyclic_coder_nonsystematic uut(clock, reset, enable, in, out);
    
    always @(posedge clock)
        if (!reset && enable)
            $write(out);
        
    initial begin
        reset <= 1'b1;
        enable <= 1'b0;
        repeat(2) @(posedge clock);
      
        reset <= 1'b0;
        @(posedge clock);
      
        enable <= 1'b1;
        repeat(19) @(posedge clock);
      
        $finish;
    end
endmodule