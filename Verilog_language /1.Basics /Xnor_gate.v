module top_module( 
    input a, 
    input b, 
    output out );
    xnor(out,a,b);
endmodule

/*module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a^b);
endmodule*/

/*module top_module( 
    input a, 
    input b, 
    output out );
    assign out=a~^b;
endmodule*/
