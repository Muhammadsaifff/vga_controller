`timescale 1ns/1ps

module Simple_pattern (
    input  clk25MHz,
    output o_hsync,
    output o_vsync,
    output o_red,
    output o_green,
    output o_blue
);

reg  [9:0] counter_x = 0,
           counter_y = 0;

reg        reset = 0;

wire       visible;
wire [18:0] address;
wire [7:0]  pixel_data;

always @(posedge clk25MHz)
    if (counter_x < 799)
        counter_x <= counter_x + 1;
    else
        counter_x <= 0;

always @(posedge clk25MHz)
    if (counter_x == 799)
        if (counter_y < 524)
            counter_y <= counter_y + 1;
        else
            counter_y <= 0;

assign o_hsync = (counter_x < 96);
assign o_vsync = (counter_y < 2);

assign visible =
    (counter_x > 144 && counter_x <= 783 &&
     counter_y > 35  && counter_y <= 514);

assign address = visible
               ? ((counter_y - 36) * 640 + (counter_x - 145))
               : 19'd0;

sram #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(19)
) fb (
    .clk(clk25MHz),
    .reset(reset),
    .chip_enable(1'b1),
    .write_enable(1'b0),
    .address(address),
    .data_in(8'd0),
    .data_out(pixel_data)
);

assign o_red   = visible ? pixel_data[2] : 1'b0;
assign o_green = visible ? pixel_data[1] : 1'b0;
assign o_blue  = visible ? pixel_data[0] : 1'b0;

endmodule
