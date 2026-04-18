module top_module (
    input clk,
    input reset,
    output [9:0] q
);
    reg[9:0]q1;
    always@(posedge clk)begin
        if(reset)begin
            q1<=10'd0;
        end
        else if(q1==10'd999)begin
            q1<=10'd0;
        end
        else
            q1<=q1+1;
    end
    assign q=q1;

endmodule
