module vga(

    input  clk,          // System clock
    output reg hsync,    // VGA Horizontal Sync
    output reg vsync,    // VGA Vertical Sync
    output reg r,        // VGA Red
    output reg g,        // VGA Green
    output reg b         // VGA Blue
);


    wire o_hsync;
    wire o_vsync;

    wire clk25MHz;

    wire red;
    wire green;
    wire blue;

    always @(*) begin
        hsync = o_hsync;
        vsync = o_vsync;

        r = red;
        g = green;
        b = blue;
    end


    PLL_8MHz u_Gowin_CLKDIV
    (
        .clk_out1(clk25MHz),
        .clk_in1(clk)
    );


    Simple_pattern top
    (
        .clk25MHz(clk25MHz),
        .o_hsync(o_hsync),
        .o_vsync(o_vsync),
        .o_red(red),
        .o_green(green),
        .o_blue(blue)
    );

endmodule
