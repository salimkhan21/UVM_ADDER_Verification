class addr_trans extends uvm_sequence_item;
rand bit [3:0] a,b;
rand bit  c;
rand bit [4:0] sum1;
`uvm_object_utils_begin(addr_trans)
`uvm_field_int(a,UVM_DEFAULT)
`uvm_field_int(b,UVM_DEFAULT)
`uvm_field_int(c,UVM_DEFAULT)
`uvm_field_int(sum1,UVM_DEFAULT)
`uvm_object_utils_end

function new (string name="addr_trans");
super.new(name);
endfunction
endclass