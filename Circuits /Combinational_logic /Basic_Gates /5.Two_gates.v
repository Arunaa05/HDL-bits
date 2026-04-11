module top_module (
    input in1,
    input in2,
    input in3,
    output out
);
    wire a;
    xnor(a,in1,in2);
    assign out=a^in3;
endmodule
