module top_module();
    reg [1:0]in;
    wire out;
    andgate a1(.*);
    initial begin
        in[0]=0;in[1]=0;#10;
        in[0]=1;in[1]=0;#10;
        in[0]=0;in[1]=1;#10;
        in[0]=1;in[1]=1;#10;
    end
endmodule
