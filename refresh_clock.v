`timescale 1ns / 1ps

module refresh_clock(
    input sysclk,
    output reg [1:0] ref_clk = 0,
    output reg blank = 1
    );
    
    parameter clk_divide = 12000; // refresh rate of 250 Hz
    
    parameter duty_cycle = 20; // percent of maximum led brightness
    
    reg [13:0] blank_release = 17 + (clk_divide-(duty_cycle*clk_divide/100)); //17 clock cycles needed to load anode values into shift register
    
    reg [14:0] clk_counter = 0;
    
    always @(posedge sysclk) begin
        if (clk_counter == clk_divide) begin
            ref_clk <= ref_clk + 1;
            clk_counter <= 0;
            blank <= 1;
        end
        else clk_counter <= clk_counter + 1;
        
        
        if (clk_counter == blank_release) blank <= 0;
    end
    
endmodule
