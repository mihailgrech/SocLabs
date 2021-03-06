module multiplication(clk, isComplex, A, B, Ai, Bi, y1, y2);
  input [15:0] A, B, Ai, Bi;
  input clk, isComplex;
  output reg [31:0] y1, y2;

  always @(clk)
    begin
      if (isComplex)
        begin
		  y1 <= A*B - Ai*Bi;
	      y2 <= B*Ai + A*Bi;
		end
      else
	    begin
		  y1 <= A * B;
          y2 <= Ai * Bi;
        end
    end
endmodule