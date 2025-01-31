`timescale 1ns / 100ps

module rs_latch(
  input logic s,
  input logic r,
  output logic q,
  output logic qn
);

  assign q = ~(r | qn);
  assign qn = ~(s | q);
  
endmodule
