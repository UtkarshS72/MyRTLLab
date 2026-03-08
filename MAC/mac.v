`timescale 1ns / 1ps

module mac(
    input clk,
    input [7:0] a,
    input [7:0] b,
    input [15:0] c,
    input valid,
    output [15:0] debug_mult,
    output reg [16:0] op,
    output reg valid_op
    );
    
    reg valid_buf = 0;
    reg [15:0] mult_pipe = 0;
    reg [15:0] c_pipe = 0;
    
    assign debug_mult = mult_pipe;
    
    always@(posedge(clk))
    begin
        mult_pipe <= a*b;
        valid_buf <= valid;
        valid_op <= valid_buf;
        c_pipe <= c;
        op <= mult_pipe + c_pipe;
    end
    
endmodule
