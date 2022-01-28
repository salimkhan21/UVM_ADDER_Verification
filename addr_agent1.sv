typedef uvm_sequencer #(addr_trans) addr_sequencer;

class addr_agent1 extends uvm_agent;
`uvm_component_utils(addr_agent1)
addr_monitor1 mon1;
addr_driver drv;
addr_sequencer sqr;

function new(string name, uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon1 = addr_monitor1::type_id::create("mon1", this);
drv = addr_driver::type_id::create("drv", this);
sqr = addr_sequencer::type_id::create("sqr", this);
endfunction

function void connect_phase(uvm_phase phase);
drv.seq_item_port.connect(sqr.seq_item_export);
endfunction

endclass