// Odd counter

module day5 (
  input     wire        clk,
  input     wire        reset,

  output    logic[7:0]  cnt_o
);

  always_ff@(posedge clk or negedge reset) begin
    if(reset)
      cnt_o <= 8'h1;
    else
      cnt_o <= cnt_o + 8'h2;
  end
  

endmodule
