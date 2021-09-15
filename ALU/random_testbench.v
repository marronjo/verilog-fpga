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

   //  test vector generator generates 5 random testvectors
integer i;

initial
begin
        f_in = 1'b1;
        x_in = 1'b1;
        n_in = 1'b1;
        
        for( i = 0; i < 8; i = i + 1)
        begin
            a_in = $random()%31; //keeps it in 32 bit range
            b_in = $random()%31;
            #200; //every 200 nanoseconds
        end  
    end
endmodule
