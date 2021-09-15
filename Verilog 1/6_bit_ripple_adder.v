`timescale 1ns/1ps

module ripple_adder( //assigning inputs and outputs for 6bit ripple adder
    input wire[5:0] x, y,
    input wire sel,
    output wire overflow, c_out,
    output wire[5:0] sum
    );
    
    wire c1, c2, c3, c4, c5, c6; //declaring wire variables for instantiating full adder
    
    full_adder out1 (.a(x[0]), .b(y[0]^sel), .cin(sel), .s(sum[0]), .cout(c1));
    full_adder out2 (.a(x[1]), .b(y[1]^sel), .cin(c1), .s(sum[1]), .cout(c2));
    full_adder out3 (.a(x[2]), .b(y[2]^sel), .cin(c2), .s(sum[2]), .cout(c3));
    full_adder out4 (.a(x[3]), .b(y[3]^sel), .cin(c3), .s(sum[3]), .cout(c4));
    full_adder out5 (.a(x[4]), .b(y[4]^sel), .cin(c4), .s(sum[4]), .cout(c5));
    full_adder out6 (.a(x[5]), .b(y[5]^sel), .cin(c5), .s(sum[5]), .cout(c6));
    
    assign c_out = c6; //cout is the last carry e.g. c6
    assign overflow = (c5 ^ c6); //overflow is carry 5 and 6 XOR together

endmodule