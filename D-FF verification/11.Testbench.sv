// Code your testbench here
// or browse Examples

import uvm_pkg::*;
`include "uvm_macros.svh"


`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"






module D_FF_tb;
  logic clk = 0;
  always #5 clk = ~clk;
  
  
  intf vintf (clk);
   
  d_ff dut (
    .clk(vintf.clk),  
    .rst(vintf.rst),  
    .d  (vintf.d),
    .q  (vintf.q)     
  );
  
   initial begin
     uvm_config_db#(virtual intf)::set(null, "*", "vintf", vintf);
    run_test("d_test");
  end
  
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0,D_FF_tb);
  end
endmodule
