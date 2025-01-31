`timescale 1ns / 100ps

module testbench;

reg clk, d;
wire q, qn;

initial begin
  $monitor("%0d s %b r %b q %b qn %b", $time, clk, d, q, qn);
  #10; clk = 0; d = 0;
  #10; clk = 1; d = 0;
  #10; clk = 1; d = 1;
  #10; clk = 0; d = 0;
  #10; clk = 1; d = 0;
  #10; clk = 0; d = 1;
  $finish;
end

d_flip_flop ff(clk, d, q, qn);

endmodule
