// Code your testbench here
// or browse Examples
`include "uvm_macros.svh";
import uvm_pkg ::*;

class driver extends uvm_driver;
  
  `uvm_component_utils(driver)
  
  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
  endfunction
  
   function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
   
    
     `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
  endfunction
  
  
  
  
endclass


class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  function new(string name = "monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
     `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
    
  endfunction
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
     `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM MONTIOR COMPONENT",UVM_LOW);
    
  endfunction
  
   function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
   
    
     `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
    
  endfunction
  
  
endclass


class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  
  driver drvh;
  monitor monh;
  
  function new(string name = "agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
     `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
     
     drvh = driver :: type_id :: create("drvh",this);
     monh = monitor :: type_id :: create("monh",this);
     
         
     
    
  endfunction
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
     `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
    
  endfunction
  
   function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
   
    
     `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
    
  endfunction
  
  
endclass

class env extends uvm_env;
  
  `uvm_component_utils(env)
  
  agent agnth;
  
  function new(string name = "env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
     `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
     
     agnth = agent :: type_id :: create("agnth",this);
    
  endfunction
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
     `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
    
  endfunction
  
    function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
   
    
      `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
    
  endfunction
  
  
endclass

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env envh;
  
  
  
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
     `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
     
     envh = env :: type_id :: create("envh",this);
     
    
  endfunction
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
     `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
    uvm_top.print_topology();
    
    `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
  endfunction
  
  
endclass

module top;
  
  initial
    run_test("test");
endmodule

OUTPUT // 
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(178) @ 0: uvm_test_top [BUILD_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(137) @ 0: uvm_test_top.envh [BUILD_PHASE] BUILD PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(94) @ 0: uvm_test_top.envh.agnth [BUILD_PHASE] BUILD PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(17) @ 0: uvm_test_top.envh.agnth.drvh [BUILD_PHASE] BUILD PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(55) @ 0: uvm_test_top.envh.agnth.monh [BUILD_PHASE] BUILD PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(24) @ 0: uvm_test_top.envh.agnth.drvh [CONNECT_PHASE] CONNECT PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(62) @ 0: uvm_test_top.envh.agnth.monh [CONNECT_PHASE] CONNECT PHASE CALLED FROM MONTIOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(107) @ 0: uvm_test_top.envh.agnth [CONNECT_PHASE] CONNECT PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(146) @ 0: uvm_test_top.envh [CONNECT_PHASE] CONNECT PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(188) @ 0: uvm_test_top [CONNECT_PHASE] CONNECT PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(34) @ 0: uvm_test_top.envh.agnth.drvh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(72) @ 0: uvm_test_top.envh.agnth.monh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(117) @ 0: uvm_test_top.envh.agnth [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(156) @ 0: uvm_test_top.envh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO ./uvm-1.2/src/base/uvm_root.svh(583) @ 0: reporter [UVMTOP] UVM testbench topology:
# KERNEL: ----------------------------------------------------------
# KERNEL: Name                   Type                    Size  Value
# KERNEL: ----------------------------------------------------------
# KERNEL: uvm_test_top           test                    -     @335 
# KERNEL:   envh                 env                     -     @350 
# KERNEL:     agnth              agent                   -     @361 
# KERNEL:       drvh             driver                  -     @373 
# KERNEL:         rsp_port       uvm_analysis_port       -     @392 
# KERNEL:         seq_item_port  uvm_seq_item_pull_port  -     @382 
# KERNEL:       monh             monitor                 -     @402 
# KERNEL: ----------------------------------------------------------
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/testbench.sv(198) @ 0: uvm_test_top [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO ./uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
