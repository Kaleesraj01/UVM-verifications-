class d_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(d_scoreboard)

  // Receiver for monitor broadcasts
  uvm_analysis_imp #(d_transaction, d_scoreboard) ap_export;

  // Counters
  int total;
  int errors;

  function new(string name = "d_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    ap_export = new("ap_export", this);
    total  = 0;
    errors = 0;
  endfunction

  // Called for EVERY transaction from Monitor
  function void write(d_transaction t);
    bit expected_q;   // declare FIRST

    total++;

    // Expected value calculation
    if (t.rst)
      expected_q = 1'b0;
    else
      expected_q = t.d;

    // Compare
    if (t.q !== expected_q) begin
      errors++;
      `uvm_error("SB",
        $sformatf("FAIL: rst=%0b d=%0b exp_q=%0b got_q=%0b",
                  t.rst, t.d, expected_q, t.q))
    end
    else begin
      `uvm_info("SB",
        $sformatf("PASS: rst=%0b d=%0b q=%0b",
                  t.rst, t.d, t.q),
        UVM_MEDIUM)
    end
  endfunction

  function void report_phase(uvm_phase phase);
    `uvm_info("SB",
      $sformatf("Scoreboard Result: %0d / %0d PASSED",
                total-errors, total),
      UVM_LOW)
  endfunction

endclass
