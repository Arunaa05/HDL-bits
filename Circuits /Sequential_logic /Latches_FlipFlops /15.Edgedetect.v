module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    wire [7:0]w;
    always@(posedge clk)
        begin
            for(i=0;i<8;i++)
                begin
                if(w[i]==0 && in[i]==1)
                    pedge[i]<=1;
                else
                    pedge[i]<=0;
                end
            w<=in;
        end
endmodule

                
            



/*module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    wire [7:0]w;
    always@(posedge clk)
        begin
            w<=in;
            pedge<=~w & in;
        end

endmodule*/
