// ============================================================
// Testbench : 4-bit Synchronous Up/Down Counter
// ============================================================

`timescale 1ns/1ps

module counter_4bit_tb;

    reg  clk, rst, enable, up_down;
    wire [3:0] count;
    wire max_reached, min_reached;

    counter_4bit uut (
        .clk(clk), .rst(rst), .enable(enable),
        .up_down(up_down), .count(count),
        .max_reached(max_reached), .min_reached(min_reached)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
        $display("=======================================================");
        $display(" 4-bit Up/Down Counter — Yashganesh Bachhav");
        $display("=======================================================");
        clk=0; rst=1; enable=0; up_down=1;
        #12; rst=0; enable=1;

        $display("\n--- Counting UP (0 to 15) ---");
        $display("Count | Max | Min");
        up_down = 1;
        for (i = 0; i < 16; i = i + 1) begin
            #10;
            $display("  %02d  |  %b  |  %b", count, max_reached, min_reached);
        end

        // Reset and count down
        rst=1; #10; rst=0;
        count <= 4'b1111; // Load max manually via force
        #2;

        $display("\n--- Counting DOWN (15 to 0) ---");
        $display("Count | Max | Min");
        up_down = 0;
        // Force count to 15 for down test
        force uut.count = 4'b1111; #1; release uut.count;

        for (i = 0; i < 16; i = i + 1) begin
            #10;
            $display("  %02d  |  %b  |  %b", count, max_reached, min_reached);
        end

        $display("=======================================================");
        $display(" Simulation Complete!");
        $display("=======================================================");
        $finish;
    end

endmodule
