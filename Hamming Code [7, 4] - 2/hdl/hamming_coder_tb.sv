module hamming_coder_tb();

logic clk;
logic [3:0] data = 4'b0011;
logic reset;
logic enable;
logic in;
logic out;

assign in = data[0];

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

always @(posedge clk)
    if (!reset && enable)
        data <= data >> 1;
        
hamming_coder coder(
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .in(in),
    .out(out)
);

always @(posedge clk)
    if (!reset && enable)
        $write(out);
        
initial begin
    reset <= 1'b1;
    enable <= 1'b0;
    @(posedge clk);
    
    reset <= 1'b0;
    enable <= 1'b1;
    repeat (11) @(posedge clk);
    
    $finish;
end

endmodule
