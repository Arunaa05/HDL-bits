module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
   parameter A=0,B_f=1,C_x=2,s0=3,s1=4,G1=5,G2=6,G_1=7,G_0=8;
    reg [3:0]state,next_state;
   
    always@(posedge clk)
        begin
            if(!resetn)
                state<=A;
            else
                state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A:next_state=(~resetn)?A:B_f;
                B_f:next_state=C_x;
                C_x:begin
                    if(x)
                        next_state=s0;
                    else
                        next_state=C_x;
                end
                s0:begin
                    if(~x)
                        next_state=s1;
                    else
                        next_state=s0;
                end
                s1:begin
                    if(x)
                        next_state=G1;
                    else
                        next_state=C_x;
                end
                 
                G1:begin
                    if(y)
                        next_state=G_1;
                    else
                        next_state=G2;
                end
                G2:begin
                    if(y)
                        next_state=G_1;
                    else
                        next_state=G_0;
                end
                G_1:next_state=(~resetn)?A:G_1;
                G_0:next_state=(~resetn)?A:G_0;
                default:next_state=A;
            endcase
        end
    
    assign f=(state==B_f);
    assign g=((state==G_1)||(state==G1)||(state==G2));
                
                    
endmodule
