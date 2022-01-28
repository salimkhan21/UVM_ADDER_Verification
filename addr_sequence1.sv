class addr_sequence1 extends uvm_sequence #(addr_trans);
addr_trans pkt; 
`uvm_object_utils(addr_sequence1)
function new (string name = "addr_sequence1");
super.new(name);
endfunction
task body();
repeat(20)
`uvm_do(pkt);
endtask
endclass