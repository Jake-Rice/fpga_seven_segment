`timescale 1ns / 1ps
module seven_seg(
    input sysclk,
    output [3:0] cath,
    output shift,
    output data,
    output latch,
    output blank
    );
    
    //reg [13:0] number; // max displayable decimal number on 4 segment display is 9,999. For hex change to [15:0]  
    
    wire [7:0] anodes;
    wire [1:0] ref_clk;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [3:0] digit2;
    wire [3:0] digit3;
    
    refresh_clock rc(
        .sysclk(sysclk),
        .ref_clk(ref_clk),
        .blank(blank)
    );
    
    cathode_driver cd(
        .ref_clk(ref_clk),
        .cath(cath)
    );
    
    anode_driver ad(
        .ref_clk(ref_clk),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .digit3(digit3),
        .anodes(anodes)
    );
    
    display disp(
        .sysclk(sysclk),
        .anodes(anodes),
        .shift(shift),
        .latch(latch),
        .data(data)
    );
    
    counter c(
        .sysclk(sysclk),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .digit3(digit3)
    );
    
endmodule
