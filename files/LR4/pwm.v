module pwm (in, clk, out);
  input clk;
  input [3:0] in;
  output reg out;

  reg [3:0] counter = 4'b0;
  
  always @(posedge clk)
    begin
      if (counter < in)
        begin 
          out <= 1'b1;
        end
      else
        begin 
          out <= 1'b0;
        end
        
    counter <= counter + 4'b1;
    
    end

endmodule