`timescale 1ns / 1ps


module anode_driver(
    input [1:0] ref_clk,
    input [3:0] digit0,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,    
    output reg [7:0] anodes
    );
    
    always @(ref_clk) begin
        case (ref_clk)
            2'b11:
                if (digit3==0) anodes <= 8'b00000000; //don't show leading zeros
                else case (digit3)
                    0: anodes <= 8'b01111110;
                    1: anodes <= 8'b01001000;
                    2: anodes <= 8'b00111101;
                    3: anodes <= 8'b01101101;
                    4: anodes <= 8'b01001011;
                    5: anodes <= 8'b01100111;
                    6: anodes <= 8'b01110111;
                    7: anodes <= 8'b01001100;
                    8: anodes <= 8'b01111111;
                    9: anodes <= 8'b01101111;
                endcase
            2'b10: 
                if (digit3==0 && digit2==0) anodes <= 8'b00000000; //don't show leading zeros
                else case (digit2)
                    0: anodes <= 8'b01111110;
                    1: anodes <= 8'b01001000;
                    2: anodes <= 8'b00111101;
                    3: anodes <= 8'b01101101;
                    4: anodes <= 8'b01001011;
                    5: anodes <= 8'b01100111;
                    6: anodes <= 8'b01110111;
                    7: anodes <= 8'b01001100;
                    8: anodes <= 8'b01111111;
                    9: anodes <= 8'b01101111;
                endcase
            2'b01:
                if (digit3==0 && digit2==0 && digit1==0) anodes <= 8'b00000000; //don't show leading zeros
                else case (digit1)
                    0: anodes <= 8'b01111110;
                    1: anodes <= 8'b01001000;
                    2: anodes <= 8'b00111101;
                    3: anodes <= 8'b01101101;
                    4: anodes <= 8'b01001011;
                    5: anodes <= 8'b01100111;
                    6: anodes <= 8'b01110111;
                    7: anodes <= 8'b01001100;
                    8: anodes <= 8'b01111111;
                    9: anodes <= 8'b01101111;
                endcase
            2'b00: case (digit0)
                    0: anodes <= 8'b01111110;
                    1: anodes <= 8'b01001000;
                    2: anodes <= 8'b00111101;
                    3: anodes <= 8'b01101101;
                    4: anodes <= 8'b01001011;
                    5: anodes <= 8'b01100111;
                    6: anodes <= 8'b01110111;
                    7: anodes <= 8'b01001100;
                    8: anodes <= 8'b01111111;
                    9: anodes <= 8'b01101111;
                endcase
        endcase
    end 
endmodule
