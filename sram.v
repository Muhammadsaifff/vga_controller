module sram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 19,
    parameter DEPTH      = (1 << ADDR_WIDTH)
)(
    input	clk,
    input	reset,
    input	chip_enable,
    input	write_enable,
    input  [ADDR_WIDTH-1:0]       address,
    input  [DATA_WIDTH-1:0]       data_in,
    output reg [DATA_WIDTH-1:0]   data_out
);

reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];
integer i;

always @(posedge clk) begin
    if (chip_enable) begin
        if (write_enable)
            memory[address] <= data_in;

        data_out <= memory[address];
    end

    if (reset)
        data_out <= 0;
end
endmodule

