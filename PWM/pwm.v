`timescale 1ns / 1ps

module pwm(
    input CLK,
    input [7:0]duty_ip,
    output PWM
    );
        
    reg [7:0]count = 0;
    reg [7:0]duty_eff = 0;
    
    always@(posedge(CLK))
    begin
        count <= count + 1;
        if(count == 99)
        begin
            count <= 0;
            duty_eff <= duty_ip;
        end
    end
    assign PWM = count < duty_eff;        
endmodule
