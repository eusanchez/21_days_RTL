module day1 (
  input   wire [7:0]    a_i,
  input   wire [7:0]    b_i,
  input   wire          sel_i,
  output  wire [7:0]    y_o
);

  assign y_o= sel_i?a_i:b_i;

endmodule



module tb;
  
  logic [7:0]a_i;
  logic [7:0]b_i;
  logic [7:0]y_o;
  logic sel_i;
  //instantition 
  day1 dut(.*);
  
  always #1 a_i=$urandom;
  
  always #1 b_i=$urandom;
  
  always #5 sel_i=~sel_i;
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    a_i=7'd0; b_i=7'd1; sel_i = 1'b0;
    #30;
    $finish;
  end
  
  initial begin 
    $monitor($time ,"  sel_i:%0d  a_i:%0d  b_i:%0d  y_0:%0d",sel_i,a_i,b_i,y_o);
  end
  
  
endmodule


