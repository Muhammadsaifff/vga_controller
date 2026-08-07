`timescale 1ns/1ps

module tb_vga;

reg clk;

wire hsync;
wire vsync;
wire r;
wire g;
wire b;

vga uut (
    .clk(clk),
    .hsync(hsync),
    .vsync(vsync),
    .r(r),
    .g(g),
    .b(b)
);

always #5 clk = ~clk;

initial begin
    clk = 0;

    $display("======================================");
    $display("      VGA Controller Testbench");
    $display("======================================");

    #200000;

    $display("Simulation Completed Successfully");
    $finish;
end

initial begin
    $monitor("Time=%0t HSYNC=%b VSYNC=%b R=%b G=%b B=%b",
             $time, hsync, vsync, r, g, b);
end

endmodule
