`include "uvm_macros.svh"
import uvm_pkg::*;

class simple_sequence extends uvm_sequence #(seq_item);
  `uvm_object_utils(simple_sequence)
  `uvm_add_to_seq_lib(simple_sequence, seq_library)
  
  function new(string name = "simple_sequencer");
    super.new(name);
  endfunction
  
  virtual task body();
    seq_item = new("seq_item");
    start_item(seq_item);
    `uvm_do (seq_item.valid)
    finish_item(seq_item);
  endtask
  
endclass