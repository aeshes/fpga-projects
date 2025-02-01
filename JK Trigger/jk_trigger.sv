`timescale 1ns / 100ps

module jk_trigger(
  input clk,
  input reset,
  input j,
  input k,
  output q,
  output qn
);

  reg state;
  
  always @(posedge clk) begin
    if(reset)
      state <= 0;
    else begin
      case({j, k})
        2'b00: state <= state;
        2'b01: state <= 1'b0;
        2'b10: state <= 1'b1;
        2'b11: state <= ~state;
      endcase
    end
  end
  
  assign q = state;
  assign qn = ~state;

endmodule
