`include "uvm_macros.svh"
import uvm_pkg::*;

`include "agent_config.sv"
`include "sequence_item.sv"
`include "sequencer.sv"
`include "sequence_library.sv"
`include "sequence.sv"
`include "driver.sv"
`include "monitor.sv"

class agent extends uvm_components;
  `uvm_components_utils(agent)
  
  agent_config mem_config;
  
  uvm_analysis_port #(seq_item) ap;
  monitor mem_monitor;
  sequencer mem_sequencer;
  simple_driver mem_driver;
  
  function new(string name = "agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    if(mem_config == null)
      if(!uvm_config_db #(agent_config)::get(this, "", "agent_config", mem_config))
        `uvm_fatal("Error")
        
        mem_monitor = monitor::type_id::create("mem_monitor", this);
    
    if(mem_config.active == UVM_ACTIVE) begin
      mem_driver = simple_driver::type_id::create("mem_driver", this);
      mem_sequencer = sequencer::type_id::create("mem_sequencer", this);
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    ap = mem_monitor.ap;
    
    if(mem_config.active == UVM_ACTIVE) begin
      mem_driver.seq_item_port.connect(mem_sequencer.seq_item_export);
    end
  endfunction
  
endclass