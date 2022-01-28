interface addr_intf( input bit clk);
logic [3:0] a,b;
logic c;
logic [4:0] sum1;
modport dut(output sum1, input a,b,c,clk);
endinterface