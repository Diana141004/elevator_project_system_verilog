`timescale 1ns / 1ps

module top(
    input logic clk,
    input logic rst,
    input logic [2:0]etaj_cerut,
    
    output logic [7:0]out
    );
    
    logic clk_2hz,sus,jos,door_cnt_en;
    logic [2:0] etaj_curent;
    logic [1:0]door_cnt_val;
    
    
//   divizor_frecventa divizor_frecventa_inst(
//        .clk(clk),
//        .rst(rst),
//        .out(clk_2hz)
//   );
   
   floor_counter floor_counter_inst(
        .rst(rst),
        .clk(clk),
        .sus(sus),
        .jos(jos),
        .out(etaj_curent)
   );
   
   door_counter door_counter_inst(
       .rst(rst),
       .clk(clk),
       .en(door_cnt_en),
       .out(door_cnt_val)
   );
   
   FSM FSM_inst(
    .clk(clk),
    .rst(rst),
    .etaj_cerut(etaj_cerut),
    .sus(sus),
    .jos(jos),
    .etaj_curent(etaj_curent),
    .door_cnt_en(door_cnt_en),
    .door_cnt_val(door_cnt_val)
   );
   
   decodor_1hot decodor_1hot_inst(
    .in(etaj_curent),
    .out(out)
   );
    
endmodule
