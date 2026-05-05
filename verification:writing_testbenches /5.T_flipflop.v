module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;
    tff t1(.*);
    always #5 clk=~clk;
    initial begin
        clk=0;
        reset=1;#10;
        reset=0;
        t=1;#10;
    end

endmodule
