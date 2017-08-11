module machine2Test;

reg  clk, rst, X1, X2, X3;
wire Y;
integer i;

machine2 mch(clk, rst, X1, X2, X3, Y);

initial
begin
  clk = 0;
  rst = 1;
  X1 = 1'b1;
  X2 = 1'b1;
  X3 = 1'b0;
  #5 rst = 0;

   for (i = 0; i < 10; i = i + 1)
    begin
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", mch.state, " X1 = ", X1, " X2 = ", X2, " X3 = ", X3, " Y= ", Y);
    end

  $display("RESET");
  clk = 0;
  rst = 1;
  X1 = 1'b0;
  X2 = 1'b1;
  X3 = 1'b0;
  #5 rst = 0;

   for (i = 0; i < 10; i = i + 1)
    begin
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", mch.state, " X1 = ", X1, " X2 = ", X2, " X3 = ", X3, " Y= ", Y);
    end
    
    $display("RESET");
  clk = 0;
  rst = 1;
  X1 = 1'b0;
  X2 = 1'b0;
  X3 = 1'b1;
  #5 rst = 0;

   for (i = 0; i < 10; i = i + 1)
    begin
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", mch.state, " X1 = ", X1, " X2 = ", X2, " X3 = ", X3, " Y= ", Y);
    end
end

endmodule