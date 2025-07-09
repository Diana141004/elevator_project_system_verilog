`timescale 1ns / 1ps

module divizor_frecventa(
    input logic clk,
    input logic rst,
    
    output logic out
    );
    
    logic [25:0]count;
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1) count <= 0;
        else count <= count+1;
    end 
    
    assign out=count[25];
    
endmodule
