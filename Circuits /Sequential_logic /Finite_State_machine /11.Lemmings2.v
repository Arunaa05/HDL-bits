module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
);
    parameter left=0,right=1,fall_left=2,fall_right=3;
    reg [1:0]state,next_state;
    always@(*)
        begin
            case(state)
                left:next_state = !ground ? fall_left:(bump_left ? right:left);
                right:next_state = !ground ? fall_right:(bump_right ? left:right);
                fall_left:next_state=!ground ? fall_left:left;
                fall_right:next_state=!ground ? fall_right:right;
                default:next_state=left;
            endcase
        end
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                state<=left;
            else
                state<=next_state;
        end
    assign walk_left=(state == left);
    assign walk_right=(state == right);
    assign aaah = ((state == fall_left)||(state == fall_right));

endmodule
