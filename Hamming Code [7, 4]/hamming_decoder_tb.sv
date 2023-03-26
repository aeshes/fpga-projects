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
        codeword = 7'b0011100;
        #100
        codeword = 7'b0101010;
        #100
        codeword = 7'b1010101;
        #100
        codeword = 7'b1011100;
        #100
        codeword = 7'b0001010;
        #100
        codeword = 7'b1010001;
    end
endmodule
