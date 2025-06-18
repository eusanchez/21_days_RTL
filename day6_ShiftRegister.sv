// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);

  // Write your logic here...
  reg [3:0] shift_reg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_reg <= 4'b0000;
    end else begin
      // Left shift: x_i comes in at LSB
      shift_reg <= {shift_reg[2:0], x_i};
    end
  end

  assign sr_o = shift_reg;
  
endmodule
