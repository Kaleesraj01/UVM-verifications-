


class my_sequence extends uvm_sequence #(my_seq_item);
  `uvm_object_utils (my_sequence)
  
  int q[$];

  
  function new (string name = "my_sequence");
    super.new(name);
  endfunction 
  
  
  task body();
    my_seq_item trans;
    
    `uvm_info (get_type_name(), $sformatf("sequence started =%s",get_full_name()),UVM_LOW)
    
    repeat (20)begin 
      trans = my_seq_item::type_id::create("trans");
      
      start_item(trans);
      trans.randomize();
      if (trans.w_a)
        q.push_back(trans.w_addr);
      else if (trans.r_b)
        trans.r_addr = q.pop_front();
        
      finish_item(trans) ;
      
      
      
      
    end 
  endtask 
endclass 
      
  
