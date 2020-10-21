`timescale 1ns / 1ps

module cathode_driver(
    input [1:0] ref_clk,
    output reg [3:0] cath
    );

    always @(ref_clk) begin
        case (ref_clk)
            2'b00: cath <= 4'b0001;
            2'b01: cath <= 4'b0010;
            2'b10: cath <= 4'b0100;
            2'b11: cath <= 4'b1000;
            default: cath <= 4'b0000;
        endcase
    end
endmodule
