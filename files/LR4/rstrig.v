module memory(
    output reg [7:0] data_out,
    input [3:0] address,
    input [7:0] data_in, 
    input write_enable,
    input clk
);
    reg [7:0] memory [0:15];

    always @(posedge clk)
      begin
        if (write_enable)
          begin
            memory[address] <= data_in;
          end
        data_out <= memory[address];
      end

endmodule