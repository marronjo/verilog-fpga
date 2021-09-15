module clock_divider(
    input cclk, //input faster clock
    input [31:0] clkscale, //slowing down scale
    output reg clk //slowed down output clock
);

reg[31:0] clkq = 0;

always@(posedge cclk)
    begin
        clkq=clkq+1;
            if(clkq>=clkscale)
                begin
                    clk=~clk;
                    clkq=0;
                end
    end
endmodule