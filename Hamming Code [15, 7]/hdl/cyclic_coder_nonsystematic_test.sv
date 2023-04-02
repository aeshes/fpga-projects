module cyclic_coder_nonsystematic_test();

    logic clk;
    logic reset;
    logic enable;
    logic in;
    reg out;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    cyclic_coder_nonsystematic uut(clk, reset, enable, in, out);
    
    initial begin
        in = 0; @(posedge clk);
        enable = 0; @(posedge clk);
        reset = 1; @(posedge clk);
        reset = 0; @(posedge clk);
        enable = 1; @(posedge clk);
        // Информационное слово
        in = 1; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 1; @(posedge clk);
        in = 1; @(posedge clk);
        // 4-битовая прокладка
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        in = 0; @(posedge clk);
        $stop;
    end
    
    always @(posedge clk)
        $display("out = %b, s = %b", out, uut.s);
endmodule