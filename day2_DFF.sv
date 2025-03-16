// Different DFF

module day2 (
  input     logic      clk,
  input     logic      reset,

  input     logic      d_i,

  //output    logic      q_norst_o,
  //output    logic      q_syncrst_o,
  output    logic      q_asyncrst_o
);

// Asyn including reset and clk, Sync ONLY includes clk. 

//Async reset FF
always_ff @(posedge clk or posedge reset) begin
  if(reset) q_asyncrst_o <= 1'b0;
    else q_asyncrst_o <= d_i;
end

//Sync reset FF
//always_ff @(posedge clk) begin
  //if(reset) q_syncrst_o <= 1'b0;
   //else q_syncrst_o <= d_i;
//end

//No reset
//always_ff @(posedge clk) begin
//    q_norst_o <= d_i;
//end

endmodule


module tb;
  output     logic      clk;
  output     logic      reset;

  output     logic      d_i;

  //input    logic      q_norst_o;
  //input    logic      q_syncrst_o;
  input    logic      q_asyncrst_o;
  
  always #2 clk = !clk;
  
  always #2 d_i = $urandom;
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    clk=0; d_i =1'b1;
    #30;
    $finish;
  end
  
  
endmodule