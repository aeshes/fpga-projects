module hamming_encoder(
    input logic clk,
    input logic [3:0] data,
    output reg [6:0] codeword
);

    always @(posedge clk)
    begin
        codeword[6] <= data[3];
        codeword[5] <= data[2];
        codeword[4] <= data[1];
        codeword[3] <= data[0];
        codeword[2] <= data[3] ^ data[1] ^ data[0];
        codeword[1] <= data[2] ^ data[1] ^ data[0];
        codeword[0] <= data[3] ^ data[2] ^ data[0];
    end
endmodule
