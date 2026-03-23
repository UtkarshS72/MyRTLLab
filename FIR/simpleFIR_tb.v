`timescale 1ns / 1ps


module simpleFIR_tb;

reg clk, rst, valid_in;
reg [7:0] xn;
wire valid_y;
wire [17:0] yn;

simpleFIR dut(.clk(clk), .rst(rst), .valid_in(valid_in), .xn(xn), .valid_y(valid_y), .yn(yn));

always #5 clk = ~clk;

initial begin
    clk = 1;
    rst = 1;
    valid_in = 0;
    #50
    rst = 0;
    #50
    xn = 1;
    valid_in = 1;
    #10
    xn = 2;
    valid_in = 0;
    #10
    xn = 3;
    valid_in = 1;
    #10
    xn = 4;
    #10
    xn = 5;
    #100;
    
end

endmodule
