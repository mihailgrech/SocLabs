module machine1(clk, reset, X, Y, Z1, Z2);
input clk, reset, X, Y;
output reg Z1, Z2;

reg [3:0] state;

parameter [3:0] stateA = 0, stateB = 1, stateC = 2,
                stateD = 3, stateE = 4, stateF = 5,
                stateG = 6, stateH = 7;

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        state = stateA;
      end
    else
      case (state)
        stateA:
          begin
            if (~X & Y)
              state = stateE;
            if (X)
              state = stateB;
          end
        stateB:
          begin
            if (!X)
              state = stateB;
            if (X)
              state = stateD;
          end
        stateC:
          begin
            if (!X && !Y)
              state = stateC;
            if (!X && Y)
              state = stateG;
            if (X)
              state = stateA;
          end
        stateD:
          begin
            if (!X)
              state = stateD;
            if (X)
              state = stateC;
          end
        stateE:
          state = stateF;
        stateF:
          state = stateB;
        stateG:
          state = stateH;
        stateH:
          state = stateD;
          
        default: state = stateA;
      endcase
  end
  
always @(state)
  begin
    case (state)
      stateA:
        begin
          Z1 = 1'b1;
          Z2 = 1'b0;
        end
      stateB:
        begin
          Z1 = 1'b1;
          Z2 = 1'b0;
        end
      stateC:
        begin
          Z1 = 1'b1;
          Z2 = 1'b0;
        end
      stateD:
        begin
          Z1 = 1'b0;
          Z2 = 1'b0;
        end
      stateE:
        begin
          Z1 = 1'b1;
          Z2 = 1'b1;
        end
      stateF:
        begin
          Z1 = 1'b1;
          Z2 = 1'b0;
        end
      stateG:
        begin
          Z1 = 1'b1;
          Z2 = 1'b1;
        end
      stateH:
        begin
          Z1 = 1'b1;
          Z2 = 1'b1;
        end
      default:
        begin
          Z1 = 1'bz;
          Z2 = 1'bz;
        end
    endcase
  end
  
endmodule