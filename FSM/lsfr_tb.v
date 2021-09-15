`timescale 1ns / 1ns
module fsm_tb2();
    reg clk; //clock
    reg rst_n; //reset
    reg sh_en; //shift enable
    reg msb;    //msb
    wire max_tick_reg; //max ticks
    wire[31:0] ones; //number of 1's
    wire[31:0] zeros; //number of 0's
    wire fsm_out; //output of fsm
    wire[31:0] fsm_count; //coutning outputs from fsm

fsm_module uut2 (clk, rst_n, msb, fsm_out); //FSM 

counter uut3 (clk,rst_n,max_tick_reg,fsm_out,msb,ones,zeros,fsm_count); //COUNTER

initial begin //clock1 signal
    clk = 1'b1;
    forever #1 clk = ~clk;  //2ns period clock
    end
    
initial begin //reset signal
    rst_n = 1'b1;
    sh_en = 1'b0;
    #10
    rst_n= 1'b0;
    sh_en = 1'b1;
end

reg[4:0] five_test;
reg expected;

integer i;
integer j;

initial begin 
    #10 //wait for reset to finish
    $display("\t\t\t- - - - - - - - - - - -");
    $display("\t\t\t| Test Value is '%b' |", 5'b10001);
    $display("\t\t\t- - - - - - - - - - - -\n");
    $display("\t\tNo.\tTest Value FSM Expected\t\t Time Occured");
    for(i = 0; i < 100; i = i + 1) begin
        expected = 1'b0;
        for(j = 0; j < 5; j = j + 1) begin
            five_test[j] = $urandom()%2; //unsigned random number between 0 and N - 1 (1), random 0 or 1
            msb = five_test[j]; //store msb in five test array
            @(posedge clk);  //move on at the rising clock edge
        end
        if(five_test == 5'b10001)begin //5 test vectors = codeword
            expected = 1'b1;
        end
        if(expected != fsm_out)begin
            $display("incorrect for value %b, loop number %d, value is: %b @time: %d", five_test, i, expected, $time);
        end
        $display("%d.\t%b\t%b\t%b\t %d",i+1,five_test,fsm_out,expected,$time);
    end
end

endmodule