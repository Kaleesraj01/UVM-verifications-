// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
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
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    `uvm_info("RUN PHASE","RUN PHASE OBJECTION CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
    #10;
    
    phase.drop_objection(this);
    `uvm_info("RUN PHASE","RUN PHASE drop objection CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
    
    `uvm_info("RUN PHASE","RUN PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
  endtask 
    
  
  
  
  
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
  
   task run_phase(uvm_phase phase);
    super.run_phase(phase);
     
       phase.raise_objection(this);
     `uvm_info("RUN PHASE","RUN PHASE OBJECTION CALLED FROM monitor COMPONENT",UVM_LOW);
    
    #50;
    
         phase.drop_objection(this);   
     `uvm_info("RUN PHASE","RUN PHASE drop objection CALLED FROM monitor COMPONENT",UVM_LOW);
    
    
     `uvm_info("RUN PHASE","RUN PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
    
  endtask
  
  
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
  
   task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    
     `uvm_info("RUN PHASE","RUN PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
    
  endtask
  
  
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
  
   task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    
     `uvm_info("RUN PHASE","RUN PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
    
  endtask
  
  
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
  
   function void connect_phase(uvm_phase
phase);
    super.connect_phase(phase);
    
     `uvm_info("CONNECT_PHASE","CONNECT PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    
    super.end_of_elaboration_phase(phase);
    
    uvm_top.print_topology();
    
    `uvm_info("END OF ELABORATION PHASE","END OF ELABORATION PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
     endfunction
    
     task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    
       `uvm_info("RUN PHASE","RUN PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
  endtask
    
 
  
  
endclass

module top;
  
  initial
    run_test("test");
endmodule

OUTPUT 
 KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(231) @ 0: uvm_test_top [BUILD_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(182) @ 0: uvm_test_top.envh [BUILD_PHASE] BUILD PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(131) @ 0: uvm_test_top.envh.agnth [BUILD_PHASE] BUILD PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(21) @ 0: uvm_test_top.envh.agnth.drvh [BUILD_PHASE] BUILD PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(76) @ 0: uvm_test_top.envh.agnth.monh [BUILD_PHASE] BUILD PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(28) @ 0: uvm_test_top.envh.agnth.drvh [CONNECT_PHASE] CONNECT PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(83) @ 0: uvm_test_top.envh.agnth.monh [CONNECT_PHASE] CONNECT PHASE CALLED FROM MONTIOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(144) @ 0: uvm_test_top.envh.agnth [CONNECT_PHASE] CONNECT PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(191) @ 0: uvm_test_top.envh [CONNECT_PHASE] CONNECT PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(242) @ 0: uvm_test_top [CONNECT_PHASE] CONNECT PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(38) @ 0: uvm_test_top.envh.agnth.drvh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(93) @ 0: uvm_test_top.envh.agnth.monh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(154) @ 0: uvm_test_top.envh.agnth [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(201) @ 0: uvm_test_top.envh [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM ENV COMPONENT
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
# KERNEL: UVM_INFO /home/runner/testbench.sv(252) @ 0: uvm_test_top [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(260) @ 0: uvm_test_top [RUN PHASE] RUN PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(209) @ 0: uvm_test_top.envh [RUN PHASE] RUN PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(162) @ 0: uvm_test_top.envh.agnth [RUN PHASE] RUN PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(101) @ 0: uvm_test_top.envh.agnth.monh [RUN PHASE] RUN PHASE OBJECTION CALLED FROM monitor COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(46) @ 0: uvm_test_top.envh.agnth.drvh [RUN PHASE] RUN PHASE OBJECTION CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(51) @ 10: uvm_test_top.envh.agnth.drvh [RUN PHASE] RUN PHASE drop objection CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(54) @ 10: uvm_test_top.envh.agnth.drvh [RUN PHASE] RUN PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(106) @ 50: uvm_test_top.envh.agnth.monh [RUN PHASE] RUN PHASE drop objection CALLED FROM monitor COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(109) @ 50: uvm_test_top.envh.agnth.monh [RUN PHASE] RUN PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO ./uvm-1.2/src/base/uvm_objection.svh(1271) @ 50: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# KERNEL: UVM_INFO ./uvm-1.2/src/base/uvm_report_server.svh(869) @ 50: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
