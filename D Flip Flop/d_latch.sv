`timescale 1ns / 100ps

module d_latch(
  input logic clk,
  input logic d,
  output logic q,
  output logic qn
);

  wire r = ~d & clk;
  wire s = d & clk;
  
  rs_latch latch(s, r, q, qn);

endmodule
