module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2
);
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9;
    
    assign next_state[s0]=(in==0)&(state[0]|state[1]|state[2]|state[3]|state[4]|state[7]|state[8]|state[9]);
    assign next_state[s1]=in & (state[0]|state[8]|state[9]);
    assign next_state[s2]=in & state[1];
    assign next_state[s3]=in & state[2];
    assign next_state[s4]=in & state[3];
    assign next_state[s5]=in & state[4];
    assign next_state[s6]=in & state[5];
    assign next_state[s7]=in & (state[6]|state[7]);
    assign next_state[s8]=(in==0) & state[5];
    assign next_state[s9]=(in==0) & state[6];
    
    assign out1=(state[8]|state[9]);
    assign out2=(state[7]|state[9]);
    
endmodule
