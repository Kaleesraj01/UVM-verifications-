


class my_environment extends uvm_env;
  `uvm_component_utils (my_environment)
  

  
  // Components
  my_agent      agent;
  my_scoreboard scb;
  
  // Constructor
  function new(string name = "my_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // Build phase - create components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create agent and scoreboard
    agent = my_agent::type_id::create("agent", this);
    scb   = my_scoreboard::type_id::create("scb", this);
    
    `uvm_info("ENV", "Environment components created", UVM_LOW)
  endfunction
  
  // Connect phase - connect monitor to scoreboard
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // Connect agent's monitor to scoreboard
    agent.monitor.ap.connect(scb.ap_export);
    
    `uvm_info("ENV", "Monitor connected to Scoreboard", UVM_LOW)
  endfunction
  
  // Report phase (optional)
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("ENV", "Environment simulation complete", UVM_LOW)
  endfunction
  
endclass
