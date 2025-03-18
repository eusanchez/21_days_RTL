// Different DFF

module day2 (
  input     logic      clk,
  input     logic      reset,

  input     logic      d_i,

  output    logic      q_norst_o,
  output    logic      q_syncrst_o,
  output    logic      q_asyncrst_o
);

// Asyn including reset and clk, Sync ONLY includes clk. 

//Async reset FF
always_ff @(posedge clk or posedge reset) begin
  if(reset) q_asyncrst_o <= 1'b0;
    else q_asyncrst_o <= d_i;
end

//Sync reset FF
always_ff @(posedge clk) begin
  if(reset) q_syncrst_o <= 1'b0;
   else q_syncrst_o <= d_i;
end

//No reset
always_ff @(posedge clk) begin
    q_norst_o <= d_i;
end

endmodule

module tb;
       logic      clk;
       logic      reset;

       logic      d_i;

       logic      q_norst_o;
       logic      q_syncrst_o;
       logic      q_asyncrst_o;
  
  day2 rtl (.*);
  
  always #2 clk = !clk;
  
  always #2 d_i = $urandom;
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    reset=1; clk=0; d_i=1'b1;
    @(posedge clk)
    reset=0;
    #30;
    $finish;
  end
  
  
endmodule