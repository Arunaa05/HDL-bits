module top_module ( );
    reg clk;
    dut c(.*);
    always #5 clk =~clk;
    initial
        clk=0;

endmodule
