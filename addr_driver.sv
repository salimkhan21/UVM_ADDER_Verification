class addr_driver extends uvm_driver#(addr_trans);
virtual addr_intf vintf;
addr_trans pkt;

`uvm_component_utils(addr_driver)

function new(string name, uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(virtual addr_intf)::get(this,"","addr_intf",vintf))
`uvm_error("Driver", "unable to get virtual interface");
endfunction

task run_phase(uvm_phase phase);
repeat(20) begin
seq_item_port.get_next_item(pkt);
@(posedge vintf.clk)
vintf.a <= pkt.a;
vintf.b <= pkt.b;
vintf.c <= pkt.c;
seq_item_port.item_done();
end
endtask

task drive_item(addr_trans pkt);
endtask

endclass

