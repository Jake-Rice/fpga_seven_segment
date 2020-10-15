`timescale 1ns / 1ps


module anode_driver(
    input [1:0] ref_clk,
    output reg [7:0] anodes
    );
    
    always @(ref_clk) begin //display "1234" for now
        case (ref_clk)
            2'b11: anodes <= 8'b01001000;
            2'b10: anodes <= 8'b00111101;
            2'b01: anodes <= 8'b01101101;
            2'b00: anodes <= 8'b01001011;
            default: anodes <= 8'b00000000;
        endcase
    end
    
endmodule
