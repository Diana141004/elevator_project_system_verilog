`timescale 1ns / 1ps

module testbench();

logic clk,rst;
logic [2:0] etaj_cerut;
logic [3:0] out;

top top_inst(.*);

initial begin 
    
    clk=0;
    
    forever begin
    #5 clk=~clk;
    end

end

initial begin
    rst=0;
    #5;
    rst=1;
    #5;
    rst=0;
    etaj_cerut=6;
    #135;
    etaj_cerut=4;
    
end

endmodule
