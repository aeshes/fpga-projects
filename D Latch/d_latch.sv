`timescale 1ns / 1ps

module d_latch(
  input logic clk,
  input logic d,
  output reg q,
  output reg qn
);

  wire r = ~d & clk;
  wire s = d & clk;
  
  rs_latch latch(s, r, q, qn);

endmodule
