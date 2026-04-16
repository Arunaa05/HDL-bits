module BCD_count(
    input clk,
    input reset,
    input ena,
    output [3:0]q
);
    always@(posedge clk)
        begin
            if(reset)
                q<=0;
            else if(ena)
                begin
                    if(q==4'd9)
                         q<=0;
                    else
                         q<=q+4'd1;
                end
        end
                
endmodule



module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    assign ena[1]=(q[3:0]==4'd9);
    assign ena[2]=(q[3:0]==4'd9)&&(q[7:4]==4'd9);
    assign ena[3]=((q[3:0]==4'd9)&&(q[7:4]==4'd9)&&(q[11:8]==4'd9));
    BCD_count c1(clk,reset,1'b1,q[3:0]);
    BCD_count c2(clk,reset,ena[1],q[7:4]);
    BCD_count c3(clk,reset,ena[2],q[11:8]);
    BCD_count c4(clk,reset,ena[3],q[15:12]);             

endmodule
