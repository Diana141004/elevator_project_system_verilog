`timescale 1ns / 1ps

module door_counter(
input logic clk, 
input logic rst,
input logic en,

output logic [1:0]out
    );
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1) begin 
            out <= 0;
        end
        else begin
            if(en==1) out <= out + 1;
            else out <= 0;
            
        end
    end
    
endmodule
