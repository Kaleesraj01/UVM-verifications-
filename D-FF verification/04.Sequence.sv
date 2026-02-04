class d_sequence extends uvm_sequence #(d_transaction );
  `uvm_object_utils (d_sequence)
   
  
  function new (string name = "d_sequence");
    super.new (name );
  endfunction 
    
  
  task body();
    d_transaction trans ;
    `uvm_info(get_type_name(), 
              $sformatf("Sequence Started: %s", get_full_name()),
              UVM_LOW) 
    
    repeat (4) begin
      
      trans = d_transaction::type_id::create("trans");
      `uvm_do(trans)
    end 
  endtask endclass
