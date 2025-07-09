`timescale 1ns / 1ps

module FSM(
    input logic clk, 
    input logic rst,
    input logic [2:0]etaj_cerut,
    input logic [2:0]etaj_curent,
    input logic [1:0]door_cnt_val,
    
    output logic sus,
    output logic jos,
    output logic door_cnt_en
    );
    
    logic [2:0] stare,stare_next;
    
    localparam idle=3'b000;
    localparam door_close=3'b001;
    localparam move_down=3'b010;
    localparam move_up=3'b011;
    localparam door_open=3'b100;
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1) begin
            stare <= idle;
        end
        
        else begin
            stare <= stare_next;
        end
    end
    
    always_comb begin
    
        stare_next=stare;
        
        case(stare)
         
            idle: begin
                if(etaj_curent!=etaj_cerut) stare_next=door_close;
            end
            
            door_close: begin
                if(door_cnt_val==3 && etaj_cerut>etaj_curent) stare_next = move_up;
                else if(door_cnt_val==3 && etaj_cerut<etaj_curent) stare_next = move_down;
                else stare_next=door_close;
            end
            
            move_up: begin
                if(etaj_curent==etaj_cerut) stare_next=door_open;
                else stare_next=move_up;
            end
            
            move_down: begin
                if(etaj_curent==etaj_cerut) stare_next=door_open;
                else stare_next=move_down;
            end
            
            door_open: begin
                if(door_cnt_val==3) stare_next=idle;
                else stare_next=door_open;
            end
            
            default: stare_next=idle;
            
        endcase
    
    end
    
    
   
      assign  door_cnt_en = (stare==door_open) || (stare==door_close);
      assign  sus = (stare==move_up) && (etaj_cerut!=etaj_curent);
      assign   jos = (stare==move_down) && (etaj_cerut!=etaj_curent);
    
    
    
    
     
endmodule
