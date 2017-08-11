module testbench();
  reg [15:0] A, B, Ai, Bi;
  reg [2:0] chooser;
  reg clk, isComplex;
  wire [31:0] y1, y2;
  
  main mn(clk, chooser, isComplex, A, B, Ai, Bi, y1, y2);

  always #10 clk = ~clk;
  
  initial
    begin
      clk = 1'b0;
      A = 16'b11011;
      B = 16'b1000;
      Ai = 16'b101011;
      Bi = 16'b1111;
      isComplex = 1'b0;
      chooser = 3'b000;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
    
      chooser = 3'b001;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
    
      chooser = 3'b010;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
    
      chooser = 3'b011;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
    
      chooser = 3'b000;
      isComplex = 1'b1;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
  
      A = 16'b0111;
      B = 16'b11;
      Ai = 16'b1;
      Bi = 16'b11;
      chooser = 1'b010;
      isComplex = 1'b1;
      #50 $display("A = %b B = %b Ai = %b Bi = %b isComplex = %b, chooser = %b y1 = %b y2 = %b", A, B, Ai, Bi, isComplex, chooser, y1, y2);
    end
endmodule