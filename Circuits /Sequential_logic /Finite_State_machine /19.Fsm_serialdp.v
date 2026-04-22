module top_module(
    input clk,
    input in,
    input reset,    
    output [7:0] out_byte,
    output done
); 
    localparam [2:0] idle=0, data=1,stop=2,done_r=3,error=4;
  reg [2:0]state, next_state;
    reg [3:0]count;
    reg [8:0]out_reg;
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
                    out_reg <= {in,out_reg[8:1]};

                end
                
                else
                    count <= 0;
                
            end
        end

    always @(*)
        begin
            case(state)
                idle : next_state = !in ? data: idle;
                data : next_state = (count ==8) ? stop:data;
                stop: next_state = (in ) ? done_r:error;
                done_r : next_state = in ? idle : data;
                error : next_state = in ? idle : error;
            endcase
        end
    assign done = (state ==done_r && ^out_reg);
    assign out_byte = (state == done_r) ? out_reg : 8'b0;

endmodule
