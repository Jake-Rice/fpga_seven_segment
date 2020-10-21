`timescale 1ns / 1ps

module display(
    input sysclk,
    input [7:0] anodes,
    output reg shift = 0,
    output reg latch = 0,
    output reg data = 0
    );
    
    reg [4:0] step_count = 0;
    reg [7:0] old_anodes = 8'b11111111;
    
    always @(posedge sysclk) begin
        if (anodes!=old_anodes) begin
            if (step_count == 16) begin
                shift <= 0;
                latch <= 1;
            end
            else if (step_count == 17) begin
                old_anodes <= anodes;
                latch <= 0;
            end
            else begin
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
        else begin 
            step_count <= 0;
        end
    end
endmodule
