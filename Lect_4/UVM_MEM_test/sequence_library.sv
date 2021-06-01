`include "uvm_macros.svh"
import uvm_pkg::*;

class seq_library extends uvm_sequence_library #(seq_item);
  `uvm_object_utils(seq_library)
  `uvm_sequence_library_utils(seq_library)
  
  function new(string name = "seq_library");
    super.new(name);
    init_sequence_library();
  endfunction
  
endclass