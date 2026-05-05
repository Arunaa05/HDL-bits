module top_module (
    output reg A,
    output reg B 
);

    // generate input patterns here
    initial begin
        A=0;#10;
        A=1;#10;
        A=0;#30;
        $finish;
    end
    initial begin
        B=0;#15;
        B=1;#25;
        B=0;#10;
        $finish;
    end

endmodule
