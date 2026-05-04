// ============================================================
// Project   : 4-bit Synchronous Up/Down Counter
// Author    : Yash Ganesh Bachhav
// College   : LGNSCOE, Nashik (SPPU)
// Domain    : VLSI Design | Verilog HDL
// ============================================================

module counter_4bit (
    input  clk,
    input  rst,      // Synchronous reset (active HIGH)
    input  enable,   // Count enable
    input  up_down,  // 1 = count up, 0 = count down
    output reg [3:0] count,
    output max_reached, // HIGH when count = 15 (up mode)
    output min_reached  // HIGH when count = 0  (down mode)
);
    assign max_reached = (count == 4'b1111) && up_down;
    assign min_reached = (count == 4'b0000) && ~up_down;

    always @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else if (enable) begin
            if (up_down)
                count <= count + 1;
            else
                count <= count - 1;
        end
    end

endmodule
