module demultiplexer(EN, D, A2, A1, A0, F7, F6, F5, F4, F3, F2, F1, F0);
  input EN, D, A2, A1, A0;
  output F7, F6, F5, F4, F3, F2, F1, F0;
    
  assign F7 = (EN) ? 1'bz                 :
              (!EN & A2 & A1 & A0) ? D    :
              0;
  
  assign F6 = (EN) ? 1'bz                 :
              (!EN & A2 & A1 & !A0) ? D   :
              0;
  
  assign F5 = (EN) ? 1'bz                 :
              (!EN & A2 & !A1 & A0) ? D   :
              0;
  assign F4 = (EN) ? 1'bz                 :
              (!EN & A2 & !A1 & !A0) ? D  :
              0;
  
  assign F3 = (EN) ? 1'bz                 :
              (!EN & !A2 & A1 & A0) ? D   :
              0;
  
  assign F2 = (EN) ? 1'bz                 :
              (!EN & !A2 & A1 & !A0) ? D  :
              0;
              
  assign F1 = (EN) ? 1'bz                 :
              (!EN & !A2 & !A1 & A0) ? D  :
              0;
              
  assign F0 = (EN) ? 1'bz                 :
              (!EN & !A2 & !A1 & !A0) ? D :
              0;
endmodule