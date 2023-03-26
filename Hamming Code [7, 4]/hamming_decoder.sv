module hamming_decoder(
    input logic clk,
    input logic [6:0] codeword,
    output logic [2:0] syndrome,
    output reg [3:0] data
);

    logic [6:0] code;
    logic [6:0] err;
    
    always @(posedge clk)
    begin
        syndrome[2] <= codeword[2] ^ codeword[3] ^ codeword[4] ^ codeword[6];
        syndrome[1] <= codeword[1] ^ codeword[3] ^ codeword[4] ^ codeword[5];
        syndrome[0] <= codeword[6] ^ codeword[5] ^ codeword[3] ^ codeword[0];
        
        code <= codeword;
        
        if (syndrome != 0)
        begin
            case (syndrome)
                3'b001 : err <= 7'b0000001;
                3'b010 : err <= 7'b0000010;  
                3'b100 : err <= 7'b0000100;  
                3'b111 : err <= 7'b0001000;  
                3'b110 : err <= 7'b0010000;  
                3'b011 : err <= 7'b0100000;  
                3'b101 : err <= 7'b1000000;                  
            endcase
            
            code <= code ^ err;
        end
     end
     
     always @(code)
     begin
        data[3] <= code[6];
        data[2] <= code[5];
        data[1] <= code[4];
        data[0] <= code[3];
     end
endmodule
