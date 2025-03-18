// Helpful videos

//https://www.youtube.com/watch?v=m2D4iYep_pQ

module day3 (
    input     wire    clk,
    input     wire    reset,

    input     wire    a_i,            // Serial input to the module

    output    wire    rising_edge_o, // Rising edge output
    output    wire    falling_edge_o // Falling edge output
);

// Internal register to save the result with delay
logic a_ff;


always_ff @(posedge clk or posedge reset) begin
    if(reset) a_ff <= 1'b0;
    else a_ff <= a_i;
end

assign rising_edge_o = a_i & ~a_ff;
assign falling_edge_o = ~a_i & a_ff;



endmodule

module tb;
    logic    clk;
    logic    reset;
    logic    a_i;          
    logic    rising_edge_o;
    logic    falling_edge_o;
  
  day3 rtl (.*);
  
  always #1 clk = !clk;
  
  always #2 a_i = $urandom;
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    reset=1; clk=0; a_i=1'b1;
    @(posedge clk);
    reset=0;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      a_i <= $random%2;
      @(posedge clk);
    end
    #50;
    $finish();
  end
  
  
endmodule