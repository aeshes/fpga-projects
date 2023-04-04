module testbench();

    logic clk;
    logic [7:0] signal;
    logic digital;
    
    initial begin
        clk = 0;
        forever #5 clk = !clk;
    end
    
    sine_signal sig(clk, signal);
    
    delta_sigma ds(clk, signal, digital);
    
    always @(posedge clk)
        $display(signal);
endmodule
