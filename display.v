`timescale 1ns / 1ps

module display(
    input sysclk,
    input [7:0] anodes,
    output reg shift = 0,
    output reg latch = 0,
    output reg data = 0,
    output reg blank = 1
    );
    
    reg [5:0] step_count = 0;    
    reg new_digit = 0;
    
    always @(anodes) new_digit <= 1;
    
    always @(posedge sysclk) begin
        if (new_digit) begin
            if (step_count == 16) begin
                new_digit <= 0;
                shift <= 0;
                latch <= 1;
                blank <= 0;
            end
            else begin
                blank <= 1;
                latch <= 0;
                case (step_count)
                    0: begin
                        data <= anodes[0];
                        shift <= 0;
                    end
                    2: begin
                        data <= anodes[1];
                        shift <= 0;
                    end
                    4: begin
                        data <= anodes[2];
                        shift <= 0;
                    end
                    6: begin
                        data <= anodes[3];
                        shift <= 0;
                    end
                    8: begin
                        data <= anodes[4];
                        shift <= 0;
                    end
                    10: begin
                        data <= anodes[5];
                        shift <= 0;
                    end
                    12: begin
                        data <= anodes[6];
                        shift <= 0;
                    end
                    14: begin
                        data <= anodes[7];
                        shift <= 0;
                    end
                    default: shift <= 1;
                endcase
            end
            step_count <= step_count + 1;
        end
        else step_count <= 0; 
    end    
endmodule
