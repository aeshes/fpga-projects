module mult_alpha_gf8_tb();

    logic clk;
    logic [2:0] out;
    
    initial clk <= 0;
    
    mult_alpha_gf8 m(clk, out);
    
    always begin
        #10 clk <= ~ clk;
    end
    
    always @(posedge clk) begin
        $display("%d", out);
    end
endmodule