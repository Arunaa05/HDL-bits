module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire e;
    wire f;
    wire g;
    and(e,a,b);
    and(f,c,d);
    or(g,e,f);
    assign out=g;
    assign out_n=~g;
endmodule
