module gt
   // I/O ports
   (
    input wire i0, i1, i2, i3,
    output wire out
   );

   // signal declaration
   wire p0, p1, p2;

   // body
   // product terms
   assign p0 = ~i2 & i0 & i1;
   assign p1 = i0 & ~i2 & ~i3;
   assign p2 = i1 & ~i3;
   //logic expressions from kmap
   
   //or gate at the end
   assign out = p0 | p1 | p2;

endmodule