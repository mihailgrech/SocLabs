module leftShift(clk, A, B, Ai, Bi, y1, y2);
  input [15:0] A, B, Ai, Bi;
  input clk;
  output reg [16:0] y1, y2;
  
  always @(clk)
     begin
      y1 <= A << 1;
      y2 <= B << 1;
    end
endmodule
