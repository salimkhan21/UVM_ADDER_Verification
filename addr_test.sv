class addr_test extends uvm_test;

`uvm_component_utils(addr_test) addr_env env;

function new (string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=addr_env::type_id::create("env",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
addr_sequence1 seq1;
phase.raise_objection(this);
seq1=addr_sequence1::type_id::create("seq1", this);
seq1.randomize;
seq1.start(env.ag.sqr);
phase.drop_objection(this);
endtask

endclass