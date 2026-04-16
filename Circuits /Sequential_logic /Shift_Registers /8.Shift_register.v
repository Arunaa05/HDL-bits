module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    wire [3:0] q;
    MUXDFF m0(KEY[0],SW[0],KEY[1],KEY[2],q[1],q[0]);
    MUXDFF m1(KEY[0],SW[1],KEY[1],KEY[2],q[2],q[1]);
    MUXDFF m2(KEY[0],SW[2],KEY[1],KEY[2],q[3],q[2]);
    MUXDFF m3(KEY[0],SW[3],KEY[1],KEY[2],KEY[3],q[3]);
    assign LEDR=q;
endmodule

module MUXDFF (
    input clk,
    input R,
    input E,
    input L,
    input W,
    output reg Q
);
    always@(posedge clk)
        begin
            case({E,L})
                2'b00:Q<=Q;
                2'b01:Q<=R;
                2'b10:Q<=W;
                2'b11:Q<=R;
            endcase
        end
endmodule
