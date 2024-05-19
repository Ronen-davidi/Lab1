
`include "uvm_interface.sv"

module top;
    import uvm_pkg::*;
    import my_pkg::*;

    bit clk;
    bit rst = 0;
    dut_if dut_if1(clk, rst);
    adder dut1(dut_if1);


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    

    initial begin 
        uvm_config_db #(virtual dut_if)::set (null, "*", "dut_if",dut_if1);
        run_test("adder_test");
    end


    
endmodule