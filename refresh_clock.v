`timescale 1ns / 1ps

module refresh_clock(
    input sysclk,
    output reg [1:0] ref_clk = 0
    );
    
    parameter clk_divide = 12000; // refresh rate of 1,000 Hz
    
    reg [13:0] clk_counter = 0;
    reg reset = 0;
    
    always @(posedge sysclk) begin
        if (clk_counter == 0) reset <= 0;
        else if (reset) clk_counter <= 0;
        else if (clk_counter == clk_divide) begin
            ref_clk <= ref_clk + 1;
            reset <= 1;
        end
        clk_counter <= clk_counter + 1;
    end
    
endmodule
