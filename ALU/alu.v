module alu( //assigning inputs and output
    input wire [5:0]input1, 
    input wire [5:0]input2,
    input wire f, x, n,
    
    output wire [5:0] num_or_less_than
    );
    
    //TOP LAYER ALU
    //Should contain all instantiations and call to muplexer
    //alu is the middleman
    
    wire bbiggera; // Used for checking B > A
    wire [5:0] axnorb; // Used for A XNOR B
    wire [5:0] aplusb; // Used for A + B && A - B
    wire [5:0] minusa; // -A
    wire [5:0] minusb; // -B
    wire co; //cout
    wire overf; //overflow
    
    wire [5:0] zero = 6'b000000; //6 bit zeros
    
    ripple_adder function0 (.x(zero[5:0]), .y(input1[5:0]), .sel(x), .c_out(co), .overflow(overf), .sum(minusa)); //-A
    
    ripple_adder function1 (.x(zero[5:0]), .y(input2[5:0]), .sel(x), .c_out(co), .overflow(overf), .sum(minusb)); //-B
    
    greater_than_only function2 (.x(input2[5:0]), .y(input1[5:0]), .greatt(bbiggera));// B > A
    
    xnord function3 (.r(input1[5:0]), .t(input2[5:0]), .xn(axnorb[5:0])); //A XNOR B
    
    ripple_adder function4 (.x(input1[5:0]), .y(input2[5:0]), .sel(n), .c_out(co), .overflow(overf), .sum(aplusb[5:0])); //A + B && A - B
    
    alu_muplex function5 (input1, input2, bbiggera, axnorb, aplusb, minusa, minusb, f, x, n, co, overf, num_or_less_than); //Multiplexer
  
    //Done
endmodule