module lfsr		
    #(
    parameter seed = 17'h4b, //(4b) base16 = (75) base10 = (117) base2 XOR (62) base2 = 01001011
    parameter N = 17         //tap value
    ) 	
	(input wire clk, sh_en, rst_n,
	//output[N-1:0] Q_out,
	output msb,
	output reg max_tick_reg);
    
    //reg max_tick_reg;
	reg[N-1:0] Q_state;	
	wire[N-1:0] Q_ns;	
	wire Q_fb;
	
	//always block assigning new values
	always@(posedge clk or posedge rst_n) begin 
        max_tick_reg = 1'b0;
        if (rst_n)begin
		  Q_state <= seed;
		end
		else if (sh_en)begin
		  Q_state <= Q_ns;
		end
		if(Q_ns == seed && !rst_n)begin
		max_tick_reg = 1'b1;
		end
	end		
					
	//next state logic
	assign Q_fb = (Q_state[13] ^~ Q_state[16]);
	assign Q_ns = {Q_state[15:0],Q_fb};	
	//output	logic
	//assign Q_out = Q_state;
	assign msb = Q_state[16]; //output msb only
endmodule