`timescale 1ns / 1ps

module floor_counter(
input logic clk,
input logic rst,
input logic sus,
input logic jos,

output logic [2:0]out
    );
    
    always_ff @(posedge clk,posedge rst) begin
        if(rst==1) begin
           out <= 0; 
        end
        else begin 
            if(sus==1) out <= out + 1;
            if(jos==1) out <= out - 1;
        end
    end
    
endmodule
