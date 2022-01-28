class addr_monitor1 extends uvm_monitor;
virtual addr_intf vintf;
bit [4:0] sum1;

`uvm_component_utils_begin(addr_monitor1)
`uvm_field_int(sum1,UVM_DEFAULT)
`uvm_component_utils_end

covergroup cg;
a:coverpoint vintf.a;
b:coverpoint vintf.b;
c:coverpoint vintf.c;
cross a,b,c;
endgroup

function new(string name, uvm_component parent);
super.new(name,parent);
cg = new;
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(virtual addr_intf)::get(this,"","addr_intf",vintf))
`uvm_error("Monitor1", "unable to get virtual interface");
endfunction

task run_phase(uvm_phase phase);
repeat(20) 
predictor();
endtask

task predictor();
@(posedge vintf.clk);
cg.sample;
sum1=vintf.a+vintf.b+vintf.c;
@(posedge vintf.clk);
if (sum1 != vintf.sum1)
begin
`uvm_error("Fail","Result unmatched")
`uvm_info("Fail",$sformatf("sum1=%d, vintf_sum1=%d",sum1,vintf.sum1), UVM_LOW)
end
else
begin
`uvm_info("Pass",$sformatf("Result matched"), UVM_LOW)
`uvm_info("Pass",$sformatf("sum1=%d, vintf_sum1=%d,vintf.a=%d,vintf.b=%d,vintf.c=%d,vintf.clk=%d",sum1,vintf.sum1,vintf.a,vintf.b,vintf.c,vintf.clk), UVM_LOW)
end
endtask

endclass

