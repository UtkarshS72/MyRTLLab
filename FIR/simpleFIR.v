`timescale 1ns / 1ps

module simpleFIR(
    input clk, rst, valid_in,
    input [7:0] xn,
    output reg valid_y,
    output reg [17:0] yn
    );
    
    localparam [7:0] H0 = 8'd01;
    localparam [7:0] H1 = 8'd02;
    localparam [7:0] H2 = 8'd02;
    localparam [7:0] H3 = 8'd01;
    
    reg [15:0] p0,p1,p2,p3;
    reg [16:0] sum_a,sum_b;
    
    reg valid_shift,valid_product, valid_sum;
    
    reg [7:0] shift_reg [0:3];
    
    always@(posedge(clk))
    begin
    if(rst) begin
        p0 <= 0;
        p1 <= 0;
        p2 <= 0;
        p3 <= 0;
        sum_a <= 0;
        sum_b <= 0;
        valid_shift <= 0;
        valid_product <= 0;
        valid_sum <= 0;
        shift_reg[0] <= 0;
        shift_reg[1] <= 0;
        shift_reg[2] <= 0;
        shift_reg[3] <= 0;
        valid_y <= 0;
        yn <= 0;
    end else begin
            valid_shift <= valid_in;
            valid_product <= valid_shift;
            valid_sum <= valid_product;
            valid_y <= valid_sum;
            if(valid_in)
            begin
                shift_reg[0] <= xn;
                shift_reg[1] <= shift_reg[0];
                shift_reg[2] <= shift_reg[1];
                shift_reg[3] <= shift_reg[2];
            end
            if(valid_shift)
            begin
                p0 <= shift_reg[0]*H0;
                p1 <= shift_reg[1]*H1;
                p2 <= shift_reg[2]*H2;
                p3 <= shift_reg[3]*H3;
            end
            if(valid_product)
            begin
                sum_a <= p0 + p1;
                sum_b <= p2 + p3;
            end
            if(valid_sum)
            begin
                yn <= sum_a + sum_b;
            end
        end
    end
endmodule
