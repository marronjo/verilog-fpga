module alu_muplex(input1, input2, bbiggera, axnorb, aplusb, minusa, minusb, f, x, n, co, overf, num_or_less_than);
    
    //inputs: fxn and all values from instantiations
    input wire [5:0] input1; //B
    input wire [5:0] input2; //A
    input wire bbiggera; // Used for checking B > A
    input wire [5:0] axnorb; // Used for A XNOR B
    input wire [5:0] aplusb; // Used for A + B && A - B
    input wire [5:0] minusa; //-A
    input wire [5:0] minusb; //-B
    input wire f, x, n; //f x n
    input wire co, overf;
    
    //outputs: output
    output wire [5:0]num_or_less_than;
    
    reg [5:0] outval;
    
    always @* begin
        if(f == 0 && x == 0 && n == 0)
            outval = input1;
            //return A
        else if(f == 0 && x == 0 && n == 1) begin
            outval = input2;
            //return B
        end
        else if(f == 0 && x == 1 && n == 0) begin
            outval = minusa;
            //return -A
        end
        else if(f == 0 && x == 1 && n == 1) begin
            outval = minusb;
            //return -B
        end
        else if(f == 1 && x == 0 && n == 0) begin
            outval = bbiggera;
            //return A < B
        end
        else if(f == 1 && x == 0 && n == 1) begin
            outval = axnorb;
            //return A XNOR B
        end
        else if(f == 1 && x == 1 && n == 0) begin
            outval = aplusb;
            //return A + B
        end
        else if(f == 1 && x == 1 && n == 1) begin
            outval = aplusb;
            //return A - B
        end     
    end 
    
    //assigning output
    assign num_or_less_than = outval;
    
endmodule   