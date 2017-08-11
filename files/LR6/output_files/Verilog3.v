module machine2 (clk, reset, x1, x2, x3, result);
input clk, reset, x1, x2, x3;
output result;

reg result;
reg [3:0] state = y0;

parameter [3:0] y0 = 0, y1 = 1, y2 = 2,
                y3 = 3, y4 = 4, y5 = 5,
                y6 = 6, y7 = 7, y8 = 8,
                y9 = 9, y10 = 10;

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        state = y0;
      end
    else
      case (state)
        y0: state = y1;
        y1: state = y2;
        y2:
          begin
            if (x2 == 1)
              begin
              if (x1 == 0)
                state = y3;
              else
                state = y5;
              end
            else
              begin
                if (x3 == 0)
                  state = y2;
                else
                  state = y8;
              end
          end
        y3: state = y4;
        y4: state = y7;
        y5: state = y6;
        y6: state = y7;
        y7: state = y8;
        y8: state = y8;
        default: state = y0;
      endcase
  end
  
always @(state)
  begin
    case (state)
      y0: result = 0;
      y1: result = 0;
      y2: result = 0;
      y3: result = 0;
      y4: result = 0;
      y5: result = 0;
      y6: result = 0;
      y7: result = 1;
      y8: result = 1;
      default: result = 1'bz;
    endcase
  end
  
endmodule
