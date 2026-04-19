module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out
); 

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            ON:begin
                if(k)
                    next_state<=OFF;
                else
                    next_state<=ON;
            end
            OFF:begin
                if(j)
                    next_state<=ON;
                else
                    next_state<=OFF;
            end
        endcase
    end

    always @(posedge clk, posedge areset) 
        begin
        // State flip-flops with asynchronous reset
            if(areset)
                state<=OFF;
            else
                state<=next_state;
        end

    
    assign out = (state == ON);

endmodule
