module fsm_module(

    input clk,  //clock
    input rst_n,//reset
    input bit,  //test bit
    output out  //output signal
);

parameter A = 3'b000,   //5 states for 5 bits
          B = 3'b001,   
          C = 3'b010,
          D = 3'b011,
          E = 3'b100;
          
reg test_bit;           //sequence is 10001
reg[2:0] next_state;    //next state reg
reg [2:0] state;        //current state reg
reg out_seq;            //output reg

always @ (posedge clk) begin
    test_bit = bit; //put value of input bit into test_bit register
    if(rst_n == 1'b1)
        out_seq <=1'b0;
    else begin
        case(state)
            A : if(test_bit == 1'b1)begin
                    next_state = B; //if 1 go to B first digit 1
                    out_seq <= 1'b0; //output 0
                    end
                else begin
                    next_state = A; //stay at current state
                    out_seq <=1'b0;
                    end
            B : if(test_bit == 1'b0)begin
                    next_state = C; //if 0 go to C, sequence so far: 10
                    out_seq <= 1'b0; //output 0
                    end
                else begin
                    next_state = B; //stay at current state
                    out_seq <= 1'b0;
                    end
            C : if(test_bit == 1'b0)begin
                    next_state = D; //if 0 go to D, sequence so far: 100
                    out_seq <= 1'b0; //output 0
                    end
                else begin
                    next_state = B; //go back to B
                    out_seq <= 1'b0;
                    end
            D : if(test_bit == 1'b0)begin
                    next_state = E; //if 0 go to E, sequence so far: 1000
                    out_seq <= 1'b0; //output 0
                    end
                else begin
                    next_state = B; //go back to B
                    out_seq <= 1'b0;
                    end
            E : if(test_bit == 1'b1)begin
                    next_state = B; //if 1 go to B, sequence so far: 10001
                    out_seq <= 1'b1; //output 1
                    end
                else begin
                    next_state = A; //go back to A, sequence broken cannot be fixed or continued .. start again
                    out_seq <= 1'b0;
                    end
            default : begin
                    next_state = A; //if in doubt start at the beginning 
                    out_seq <= 1'b0;
                    end
             endcase
      end
end


always @ (posedge clk) begin
    if (rst_n == 1'b1) begin
        state = A;
        end
    else begin
        state <= next_state;
        end 
    end
assign out = out_seq;
endmodule