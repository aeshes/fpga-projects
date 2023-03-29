module m_sequence_15_4_tb();

    logic clock;
    logic reset;
    logic out;
    
    initial begin
        clock <= 0;
        forever #5 clock <= !clock;
    end
    
    m_sequence_15_4 uut(clock, reset, out);
    
    initial begin
        reset <= 1; @(posedge clock);
        reset <= 0;
    end
    
    always @(posedge clock)
        $write(out);
endmodule