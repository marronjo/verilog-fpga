`timescale 1 ns/1 ps
 module alu_testbench;
   // signal declaration
   reg  [5:0] a_in; 
   reg  [5:0] b_in;// A and b inputs
   reg  f_in; //fxn input
   reg  x_in;
   reg  n_in;
   //wire  overflow_a, c_output;
   wire [5:0] outputs;
  
   // instantiate the circuit under test
   alu uut
      (.input1(a_in), .input2(b_in), .f(f_in), .x(x_in), .n(n_in), .num_or_less_than(outputs));

   //  test vector generator
   initial
   begin
      // test vector 1
      a_in = 6'b000111;
      b_in = 6'b000000; //should return A
      f_in = 1'b0; 
      x_in = 1'b0;
      n_in = 1'b0;
      # 200;
      // test vector 2
      a_in = 6'b000000;
      b_in = 6'b000011;
      f_in = 1'b0; 
      x_in = 1'b0;
      n_in = 1'b1; //should return B
      # 200;
      // test vector 3
      a_in = 6'b001100;
      b_in = 6'b000000;
      f_in = 1'b0; 
      x_in = 1'b1;
      n_in = 1'b0; //should return -A, 1111 11
      # 200;
      // test vector 4
      a_in = 6'b000000;
      b_in = 6'b000111;
      f_in = 1'b0; 
      x_in = 1'b1;
      n_in = 1'b1; //should return -B, 1111 11
      # 200;
      // test vector 5
      a_in = 6'b000011;
      b_in = 6'b000110;
      f_in = 1'b1; 
      x_in = 1'b0;
      n_in = 1'b0; //should return A < B, true
      # 200;
      // test vector 6
      a_in = 6'b010101;
      b_in = 6'b101101;
      f_in = 1'b1; 
      x_in = 1'b0;
      n_in = 1'b1; //should return A xnor B, 0000 01
      # 200;
      // test vector 7
      a_in = 6'b000001;
      b_in = 6'b000001;
      f_in = 1'b1; 
      x_in = 1'b1;
      n_in = 1'b0; //should return A + B 0000 10
      # 200;
      // test vector 8
      a_in = 6'b000111;
      b_in = 6'b000011;
      f_in = 1'b1; 
      x_in = 1'b1;
      n_in = 1'b1; //should return A - B, 0001 00
      # 200;
      $stop;
   end
endmodule