module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter 	A=0,B=1;
    reg state,next_state;
    reg [1:0]count,count1;
    
    always@(posedge clk)
        begin
            if(reset)
                begin
                    state<=A;
                    count=0;
                    count1=0;
                end   
            else begin
                state<=next_state;
                if(state == B)
                    begin
                        if(count==3)
                            begin
                                count=0;
                                count1=0;
                            end
                        if(w==1)
                            count1=count1+1;
                        count =count+1;
                    end
            end
                      
           end
    always@(*)
        begin
            case(state)
                A:next_state= s ? B : A;
                B:next_state= B;
                default: next_state = B;
            endcase
        end
    
    assign z = (count==3 && count1==2);
endmodule
