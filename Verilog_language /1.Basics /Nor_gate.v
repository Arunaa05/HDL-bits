module top_module( 
    input a, 
    input b, 
    output out );
    nor(out,a,b);
endmodule


/*module top_module( 
    input a, 
    input b, 
    output out );
    assign out =~(a|b);
endmodule*/
