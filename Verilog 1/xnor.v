`timescale 1ns/1ps

module xnord( //assigning inputs and outputs for xnor
    input wire[5:0] r, t,
    output wire[5:0] xn
    );
    
    //instantiations for mystery module, 1 bit xnor, using 1 bit at a time

    mystery_module mname0 (.i0(r[0]), .i1(t[0]), .op(xn[0]));
    mystery_module mname1 (.i0(r[1]), .i1(t[1]), .op(xn[1]));
    mystery_module mname2 (.i0(r[2]), .i1(t[2]), .op(xn[2]));
    mystery_module mname3 (.i0(r[3]), .i1(t[3]), .op(xn[3]));
    mystery_module mname4 (.i0(r[4]), .i1(t[4]), .op(xn[4]));
    mystery_module mname5 (.i0(r[5]), .i1(t[5]), .op(xn[5]));
    
    //output xn[5:0] is output automatically from instantiations
endmodule