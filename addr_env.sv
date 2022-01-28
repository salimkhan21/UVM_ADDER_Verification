class addr_env extends uvm_env;

`uvm_component_utils(addr_env)
addr_agent1 ag;

function new(string name, uvm_component parent);
super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
super.build_phase(phase);
ag = addr_agent1::type_id::create("ag", this);
endfunction

endclass