`timescale 1ns / 100ps

module testbench;

reg clk, reset, j, k;
wire q, qn;

initial begin
  #10; reset = 1;
  #10; reset = 0;
  #10; clk = 0; j = 0; k = 0;
  #10; clk = 0;
  #10; clk = 1; j = 0; k = 0;
  #10; clk = 0;
  #10; clk = 1; j = 1; k = 0;
  #10; clk = 0;
  #10; clk = 1; j = 0; k = 1;
  #10; clk = 0;
  #10; clk = 1; j = 1; k = 1;
  $finish;
end

jk_trigger trigger(clk, reset, j, k, q, qn);

endmodule
