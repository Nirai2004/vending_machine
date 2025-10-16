`timescale 1ns/1ps

module vending_machine_vivado (
    input  wire clk,
    input  wire rst,
    input  wire coin1,
    input  wire coin5,
    input  wire coin10,
    input  wire sel_product0,
    input  wire sel_product1,
    input  wire sel_product2,
    output reg  dispense,
    output reg  [7:0] change
);

    parameter PRICE0 = 8'd10;
    parameter PRICE1 = 8'd15;
    parameter PRICE2 = 8'd20;

    reg [7:0] amount;
    reg [7:0] price;
    reg [1:0] state;

    localparam IDLE      = 2'b00;
    localparam WAIT_COIN = 2'b01;
    localparam DISPENSE  = 2'b10;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            amount <= 0;
            dispense <= 0;
            change <= 0;
            price <= 0;
        end else begin
            dispense <= 0;
            change <= 0;

            case(state)
                IDLE: begin
                    amount <= 0;
                    if(sel_product0) price <= PRICE0;
                    else if(sel_product1) price <= PRICE1;
                    else if(sel_product2) price <= PRICE2;
                    if(sel_product0 || sel_product1 || sel_product2)
                        state <= WAIT_COIN;
                end

                WAIT_COIN: begin
                    amount <= amount + (coin1 ? 8'd1 : 0) + (coin5 ? 8'd5 : 0) + (coin10 ? 8'd10 : 0);
                    if(amount + (coin1 ? 8'd1 : 0) + (coin5 ? 8'd5 : 0) + (coin10 ? 8'd10 : 0) >= price) begin
                        state <= DISPENSE;
                    end
                end

                DISPENSE: begin
                    dispense <= 1'b1;
                    change <= amount - price + (coin1 ? 8'd1 : 0) + (coin5 ? 8'd5 : 0) + (coin10 ? 8'd10 : 0);
                    amount <= 8'd0;
                    price <= 8'd0;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
