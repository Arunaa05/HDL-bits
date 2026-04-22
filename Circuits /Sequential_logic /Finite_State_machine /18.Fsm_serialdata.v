module top_module(
    input clk,
    input in,
    input reset,    
    output [7:0] out_byte,
    output done
);
    localparam [2:0] idle=0,data=1,stop=2,done_r=3,error=4;
    reg [2:0]state,next_state;
    reg [2:0]count;
    reg [7:0]out_reg;
    
    always @(posedge clk)
        begin
            if(reset) begin
                state <= idle;
                count <=0;
                out_reg <=0;
            end
            else begin
                state <= next_state;
                
                if(state == data) begin
                    count <= count+1;
                    out_reg <= {in,out_reg[7:1]};

                end
                
                else
                    count <= 0;
                
            end
        end

    always @(*)
        begin
            case(state)
                idle :begin
                    if(!in)
                        next_state=data;
                    else
                        next_state=idle;
                end
                data :begin
                    if(count ==7) 
                        next_state=stop;
                    else
                        next_state=data;
                end
                stop:begin
                    if(in)
                        next_state=done_r;
                    else
                        next_state=error;
                end
                done_r :begin
                    if(in)
                        next_state=idle;
                    else
                        next_state=data;
                end
                error :begin
                    if(in)
                        next_state=idle;
                    else
                        next_state=error;
                end
            endcase
        end
    assign done = (state ==done_r);
    assign out_byte = (state == done_r) ? out_reg : 8'b0;

endmodule
