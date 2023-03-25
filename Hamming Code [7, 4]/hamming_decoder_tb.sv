module hamming_decoder_tb();
    logic clk;
    logic [6:0] codeword;
    logic [2:0] syndrome;
    logic [3:0] data;
    
    hamming_decoder dut(clk, codeword, syndrome, data);
    
    initial begin
        clk <= '0;
        forever #10 clk <= ~clk;
    end
    
    initial
    begin
        codeword = 7'b0011101;
        #100
        codeword = 7'b0101100;
        #100
        codeword = 7'b1010011;
        #100
        codeword = 7'b1111111;
    end
endmodule
