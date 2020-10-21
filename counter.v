`timescale 1ns / 1ps

module counter(
    input sysclk,
    output reg [3:0] digit0=0,
    output reg [3:0] digit1=0,
    output reg [3:0] digit2=0,
    output reg [3:0] digit3=0
    );
    
    parameter step_time = 12000000;
    reg [23:0] step_counter = 0;
    reg [13:0] number = 0;
    
    always @(posedge sysclk) begin
        if (step_counter == step_time) begin
            step_counter <= 0;
            if (number == 9999) number <= 0;
            else number <= number + 1;
            digit0 <= number%10;                          
            digit1 <= (number%100 - number%10) / 10;      
            digit2 <= (number%1000 - number%100) / 100;   
            digit3 <= (number%10000 - number%1000) / 1000;
        end
        else step_counter <= step_counter+1;
    end
    
endmodule
