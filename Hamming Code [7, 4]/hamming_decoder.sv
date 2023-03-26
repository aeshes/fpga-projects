module hamming_decoder(
    input logic clk,
    input logic [6:0] codeword,
    output logic [2:0] syndrome,
    output reg [3:0] data
);

    logic [6:0] code;
    always @(posedge clk)
    begin
        syndrome[2] <= codeword[6] ^ codeword[4] ^ codeword[2] ^ codeword[0];
        syndrome[1] <= codeword[5] ^ codeword[4] ^ codeword[1] ^ codeword[0];
        syndrome[0] <= codeword[3] ^ codeword[2] ^ codeword[1] ^ codeword[0];
        
        code <= codeword;
        
        if (syndrome != 0)
            code[syndrome] <= ~codeword[syndrome];
     end
     
     always @(code)
     begin
        data[3] <= code[6];
        data[2] <= code[5];
        data[1] <= code[4];
        data[0] <= code[3];
     end
endmodule
