`timescale 1ns/1ps

module tb_vending_machine_vivado;

    reg clk;
    reg rst;
    reg coin1, coin5, coin10;
    reg sel_product0, sel_product1, sel_product2;
    wire dispense;
    wire [7:0] change;

    // Instantiate the DUT
    vending_machine_vivado dut (
        .clk(clk),
        .rst(rst),
        .coin1(coin1),
        .coin5(coin5),
        .coin10(coin10),
        .sel_product0(sel_product0),
        .sel_product1(sel_product1),
        .sel_product2(sel_product2),
        .dispense(dispense),
        .change(change)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Tasks to pulse coins
    task pulse_coin1;
    begin
        coin1 = 1;
        @(posedge clk);
        coin1 = 0;
        #1;
    end
    endtask

    task pulse_coin5;
    begin
        coin5 = 1;
        @(posedge clk);
        coin5 = 0;
        #1;
    end
    endtask

    task pulse_coin10;
    begin
        coin10 = 1;
        @(posedge clk);
        coin10 = 0;
        #1;
    end
    endtask

    // Task to select a product for 1 clock cycle
    task select_product(input reg p0, input reg p1, input reg p2);
    begin
        sel_product0 = p0;
        sel_product1 = p1;
        sel_product2 = p2;
        @(posedge clk);
        sel_product0 = 0;
        sel_product1 = 0;
        sel_product2 = 0;
        #1;
    end
    endtask

    // Monitor signals
    initial begin
        $dumpfile("vending_vivado_tb.vcd");
        $dumpvars(0, tb_vending_machine_vivado);
        $display("time\tclk\trst\tcoin1\tcoin5\tcoin10\tsel0\tsel1\tsel2\tdispense\tchange");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%d",
                 $time, clk, rst, coin1, coin5, coin10,
                 sel_product0, sel_product1, sel_product2, dispense, change);
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        coin1 = 0; coin5 = 0; coin10 = 0;
        sel_product0 = 0; sel_product1 = 0; sel_product2 = 0;
        @(posedge clk);
        rst = 0;
        @(posedge clk);

        // Test 1: Product 0 (price 10), insert 5+5
        select_product(1,0,0);
        pulse_coin5;
        pulse_coin5;
        @(posedge clk);

        // Test 2: Product 1 (price 15), insert 10+5
        select_product(0,1,0);
        pulse_coin10;
        pulse_coin5;
        @(posedge clk);

        // Test 3: Product 2 (price 20), insert 10+10
        select_product(0,0,1);
        pulse_coin10;
        pulse_coin10;
        @(posedge clk);

        // Idle cycles
        repeat(5) @(posedge clk);

        $display("Simulation finished");
        $finish;
    end

endmodule
