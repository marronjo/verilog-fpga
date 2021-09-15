module greater_than_only
   (
    input  wire[7:0] x, y,		//2 6-bit inputs		
    output wire greatt			//output signal
   );
   
   assign x[7:6] = 2'b00;
   assign y[7:6] = 2'b00;
   
   wire g1, g3, g4, g6, g7; //wires for A > B circuit
   
   gt gt_name1 (.i0(x[5]), .i1(x[4]), .i2(y[5]), .i3(y[4]), .out(g1));
   //check if digit 6 and 5 of A > B
   
   gt gt_name3 (.i0(x[3]), .i1(x[2]), .i2(y[3]), .i3(y[2]), .out(g3));
   gt gt_name4 (.i0(y[5]), .i1(y[4]), .i2(x[5]), .i3(x[4]), .out(g4));//invert
   //check if digit 4 and 3 of A > B
   //check if  digit 6 and 5 of B not > A
   
   gt gt_name5 (.i0(x[1]), .i1(x[0]), .i2(y[1]), .i3(y[0]), .out(g6));
   gt gt_name6 (.i0(y[3]), .i1(y[2]), .i2(x[3]), .i3(x[2]), .out(g7));//invert
   //check if digit 2 and 1 of A > B
   //check if digit 4 and 3 of B not > A
   
   wire and2, and3; //2 wires for greater than outputs
   
   assign and2 = g3 & ~g4;
   assign and3 = g6 & ~g7 & ~g4;
   //AND gates joining signals from A > B
  
   assign greatt = and2 | and3 | g1;
   //OR gate output of 8 bit comparator

endmodule