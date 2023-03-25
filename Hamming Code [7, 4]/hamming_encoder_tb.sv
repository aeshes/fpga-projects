module hamming_encoder_tb();

    reg clk;
    reg [3:0] data;
    logic [6:0] codeword;
    
    hamming_encoder dut(clk, data, codeword);
    
    initial begin
        clk <= '0;
        forever #10 clk <= ~clk;
    end
    
    initial
    begin
        data = 4'b0011;
        #100
        data = 4'b0101;
        #100
        data = 4'b1010;
        #100
        data = 4'b1111;
    end
endmodule