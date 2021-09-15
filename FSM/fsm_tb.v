`timescale 1ns / 1ns
module fsm_tb(
    input clk,  //clock
    input rst_n, //reset
    input sh_en, //shift enable
    output[15:0] fsm_counter //16 bit counter, shown on all LED's on Basys 3 board
);

wire[31:0] ones, zeros;
wire msb;
wire fsm_out;
wire max_tick_reg;
wire cclk; //clock slowed down by clock divider

//instantiations...
clock_divider uut0(clk, 50000, cclk); //slows down clock cycles 

lfsr uut1(cclk, sh_en, rst_n, msb, max_tick_reg);  //LFSR

fsm_module uut2 (cclk, rst_n, msb, fsm_out); //FSM 

counter uut3 (cclk, rst_n, max_tick_reg,fsm_out ,msb, ones, zeros, fsm_counter); //COUNTER

endmodule