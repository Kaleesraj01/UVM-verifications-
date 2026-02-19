class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  // Environment instance
  my_environment env;
  
  // Sequence instance
  my_sequence seq;
  
  // Constructor
  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create environment
    env = my_environment::type_id::create("env", this);
    
    // Create sequence (created here but will be started in run_phase)
    seq = my_sequence::type_id::create("seq");
    
    `uvm_info("TEST", "Test components created", UVM_LOW)
  endfunction
  
  // Run phase - start the sequence
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Raise objection to keep simulation running
    phase.raise_objection(this);
    
    `uvm_info("TEST", "Starting test sequence", UVM_LOW)
    
    // Option 1: Start sequence manually
    seq.start(env.agent.sequencer);
    
  
    // Wait a bit for sequence to complete
    #100;
    
    // Drop objection to allow simulation to end
    phase.drop_objection(this);
    
    `uvm_info("TEST", "Test sequence completed", UVM_LOW)
  endtask
  
 
  
endclass
