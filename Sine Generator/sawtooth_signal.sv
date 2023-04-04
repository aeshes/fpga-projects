module sawtooth_signal(
    input logic clk,
    output logic [7:0] signal
);

    logic [7:0] counter = 0;
    
    always_ff @(posedge clk)
        if (counter == 8'b11111111)
            counter <= 0;
        else
            counter <= counter + 1;
    
    assign signal = counter;
endmodule
