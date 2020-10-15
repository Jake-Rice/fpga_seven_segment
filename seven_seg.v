`timescale 1ns / 1ps
module seven_seg(
    input sysclk,
    output [3:0] cath,
    output shift,
    output data,
    output latch,
    output blank
    );
    
    wire [7:0] anodes;
    wire [1:0] ref_clk;
    
    refresh_clock rc(
        .sysclk(sysclk),
        .ref_clk(ref_clk)
    );
    
    cathode_driver cd(
        .ref_clk(ref_clk),
        .cath(cath)
    );
    
    anode_driver ad(
        .ref_clk(ref_clk),
        .anodes(anodes)
    );
    
    display disp(
        .sysclk(sysclk),
        .anodes(anodes),
        .shift(shift),
        .latch(latch),
        .data(data),
        .blank(blank)
    );
    
endmodule
