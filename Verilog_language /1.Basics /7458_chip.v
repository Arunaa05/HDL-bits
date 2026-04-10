module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire h;
    wire i;
    wire k;
    wire l;
    assign h=(p2a&p2b);
    assign i=(p2c&p2d);
    assign p2y=(h|i);
    assign k=(p1a&p1c&p1b);
    assign l=(p1f&p1e&p1d);
    assign p1y=(k|l);
endmodule
