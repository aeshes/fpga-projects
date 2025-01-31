`timescale 1ns / 100ps

module main_tb;

reg s, r;
wire q, qn;

initial begin
  $monitor("%0d s %b r %b q %b qn %b", $time, s, r, q, qn);
  #10; s = 0; r = 0;
  #10; s = 1; r = 0;
  #10; s = 0; r = 0;
  #10; s = 0; r = 1;
  #10; s = 0; r = 0;
  #10; s = 1; r = 1;
  #10; s = 0; r = 0;
  #10; s = 0; r = 0;
  $finish;
end

main m(.s(s), .r(r), .q(q), .qn(qn));

endmodule
