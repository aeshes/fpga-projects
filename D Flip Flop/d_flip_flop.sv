`timescale 1ns / 100ps

module d_flip_flop(
  input logic clk,
  input logic d,
  output logic q,
  output logic qn
);

 wire w;
 
 d_latch master(.clk, .d, .q(w));
 d_latch slave(clk, w, q, qn); 

endmodule
