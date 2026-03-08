`timescale 1ns / 1ps


module pwm_tb;

reg clk;
reg [7:0] duty_ip;
wire PWM;

pwm dut_pwm(
    .CLK(clk),
    .duty_ip(duty_ip),
    .PWM(PWM)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        
        duty_ip = 90;
        #9500
        duty_ip = 10;
        #6000
        duty_ip = 50;
        #15000
        duty_ip = 0;
    end
    

endmodule
