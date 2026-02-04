
interface intf (input logic clk );
  logic rst ;
  logic d;
  logic d ;
  
  clocking drv (@ negedge clk);
    default input#1 output#1;
    output rst , d ;
    input q ;
  endclocking 
  
  
  clocking mon (@ posedge clk );
    default input#1 output#1;
    input d,q,rst;
  endclocking 
  
endinterface 
