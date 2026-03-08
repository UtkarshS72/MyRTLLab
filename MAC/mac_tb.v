`timescale 1ns / 1ps


module mac_tb;
    
    reg clk,valid;
    reg [7:0] a,b;
    reg [15:0] c;
    
    wire [15:0] debug_mult;
    wire [16:0] op;
    wire valid_op;
    
    mac dut_mac(clk,a,b,c,valid,debug_mult,op,valid_op);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        a = 0;
        b = 0;
        c = 0;
        valid = 0;
        
        #5
        
        a = 2;
        b = 3;
        c = 1;
        valid = 1;
        
        #10
        
        a = 9;
        b = 2;
        c = 5;
        valid = 1;
        
        #10
        
        a = 7;
        b = 3;
        c = 4;
        valid = 0;  
        
        #10
        
        a = 1;
        b = 2;
        c = 3;
        valid = 1;  
    end
endmodule
