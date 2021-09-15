module counter	
(
input clk,              //clock
input rst_n,            //reset
input max_tick_reg,     //msx ticks
input fsm_out,          //result from fsm
input wire msb,         //msb from lfsr
output wire[31:0] ones, //32 bit just to be safe
output wire[31:0] zeros,//counting no. of zeros in msb
output wire[31:0] fsm_count//counting no. of ones in msb
);	 

reg[31:0] one = 0; //initialise
reg[31:0] zero = 0;
reg[31:0] fsm_num = 0;

    always@(posedge clk && !rst_n) //changing counter values
        if(max_tick_reg)begin
            one = 0;
            zero = 0; //reset values
            fsm_num = 16'b1111111111111111; //light up all LED's
        end
        else begin
            if(fsm_out == 1'b1)begin
                fsm_num = fsm_num + 1'b1; //count number of times codeword is found    
            end
            else if(msb)
                one = one + 1'b1; 
            else if(!msb)
                zero = zero + 1'b1;
        end
    
    assign fsm_count = fsm_num;
    assign ones = one; //assign wires to regs
    assign zeros = zero;
endmodule