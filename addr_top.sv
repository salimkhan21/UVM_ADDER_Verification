module addr_top;
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "files.sv"

bit clk;
addr_intf intf(clk);
addr_dut dut(intf);

initial
forever #10 clk =~clk;

initial
begin
uvm_config_db #(virtual addr_intf)::set(null,"*","addr_intf",intf);
run_test("addr_test");
end

endmodule
