module delta_sigma(
    input logic clk,
    input logic [7:0] in,
    output logic out
);

    logic [9:0] delta_adder = 0;
    logic [9:0] sigma_adder = 0;
    logic [9:0] sigma_latch = 0;
    logic [9:0] delta_b = 0;
    
    always @(sigma_latch)
        delta_b = { sigma_latch[9], sigma_latch[9] } << 8;
        
    always @(in or delta_b)
        delta_adder = in + delta_b;
        
    always @(delta_adder or sigma_latch)
        sigma_adder = delta_adder + sigma_latch;
        
    always @(posedge clk) begin
        sigma_latch <= sigma_adder;
        out <=  sigma_latch[9];
    end
endmodule
