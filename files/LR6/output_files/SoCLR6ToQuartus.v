module myclock (clkFromPin, out);
  input clkFromPin;
  output out;

  reg [24:0] counter = 24'b0;
  reg out;
  
  always @(posedge clkFromPin)
    begin
      if (counter == 24'b1111111111111111111111111)
        begin 
				out = 1'b1;
        end
		else
			begin
				out = 1'b0;
			end
      
    counter <= counter + 24'b1;
    
 end

endmodule


