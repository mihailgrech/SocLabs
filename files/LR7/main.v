module main(clk, chooser, isComplex, A, B, Ai, Bi, y1, y2);
  input clk, isComplex;
  input [2:0] chooser;
  input [15:0] A, B, Ai, Bi;
  output reg [31:0] y1, y2;

  reg [5:0] enableInput;

  wire [16:0] atemp16Y1, atemp16Y2;
  wire [16:0] btemp16Y1, btemp16Y2;
  wire [31:0] ctemp32Y1, ctemp32Y2;
  wire [31:0] dtemp32Y1, dtemp32Y2;
  wire [16:0] etemp16Y1, etemp16Y2;
  wire [16:0] ftemp16Y1, ftemp16Y2;

  addition add(clk & enableInput[0], A, B, Ai, Bi, atemp16Y1, atemp16Y2);  
  subtraction sb(clk & enableInput[1], A, B, Ai, Bi, btemp16Y1, btemp16Y2);
  multiplication mp(clk & enableInput[2], isComplex, A, B, Ai, Bi, ctemp32Y1, ctemp32Y2);
  division dv(clk & enableInput[3], isComplex, A, B, Ai, Bi, dtemp32Y1, dtemp32Y2);
  rightShift rS(clk & enableInput[4], A, B, Ai, Bi, etemp16Y1, etemp16Y2);
  leftShift lS(clk & enableInput[5], A, B, Ai, Bi, ftemp16Y1, ftemp16Y2);
      
  always @(posedge clk)
    begin
      case (chooser)
        3'b000:
          begin
            reset;
            enableInput[0] <= 1'b1;

            y1 = atemp16Y1;
            y2 = atemp16Y2;
	      end
	    3'b001:
          begin
            reset;
            enableInput[1] <= 1'b1;

            y1 = btemp16Y1;
            y2 = btemp16Y2;
	      end
        3'b010:
          begin
            reset;
            enableInput[2] <= 1'b1;
           
            y1 = ctemp32Y1;
            y2 = ctemp32Y2;
	      end
        3'b011:
          begin
            reset;
            enableInput[3] <= 1'b1;

            y1 = dtemp32Y1;
            y2 = dtemp32Y2;
          end
        3'b100:
          begin
            reset;
            enableInput[4] <= 1'b1;

            y1 = etemp16Y1;
            y2 = etemp16Y2;
          end
        3'b101:
          begin
            reset;
            enableInput[5] <= 1'b1;
	       
            y1 = ftemp16Y1;
            y2 = ftemp16Y2;
          end
        default:
          reset;
      endcase
    end

  task reset;
    begin
      enableInput[0] <= 1'b0;
      enableInput[1] <= 1'b0;
      enableInput[2] <= 1'b0;
      enableInput[3] <= 1'b0;
      enableInput[4] <= 1'b0;
      enableInput[5] <= 1'b0;
    end
  endtask	
endmodule