module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done
); 
    
    parameter byte1=0,byte2=1,byte3=2,done_r=3;
    reg [1:0]state,next_state;
    reg [23:0]data;
    always@(*)
        begin
            case(state)
                byte1:next_state = in[3] ? byte2 : byte1;
                byte2:next_state = byte3;
                byte3:next_state = done_r;
                done_r:next_state = in[3] ? byte2 : byte1;
            endcase
        end
    
    always@(posedge clk)
        begin
            if(reset)
                state<=byte1;
            else
                state<=next_state;
        end
    
    assign done = (state == done_r);
    
     always@(posedge clk)
        begin
            if(reset)
                data<=24'b0;
            else
                begin
                    data[23:16]<=data[15:8];
                    data[15:8]<=data[7:0];
                    data[7:0]<=in;
                end
        end
     
    assign out_bytes = done ? data : 24'bx;
        
endmodule
