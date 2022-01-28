module addr_dut(addr_intf.dut intf);
always @(posedge intf.clk)
intf.sum1<=intf.a+intf.b+intf.c;
endmodule