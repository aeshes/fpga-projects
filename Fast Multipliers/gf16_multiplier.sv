module gf16_multiplier(
    input logic [3:0] in,
    output logic [3:0] out
);

    // Умножение на элемент поля GF(16) γ = z^3
    // Поле порождено примитивным многочленом z^4 + z + 1 = 0
    
    assign out[3] = in[3] ^ in[0];
    assign out[2] = in[3] ^ in[2];
    assign out[1] = in[2] ^ in[1];
    assign out[0] = in[1];
    
endmodule