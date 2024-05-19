
 
 class my_monitor_out extends uvm_monitor;
    `uvm_component_utils(my_monitor);
    uvm_analysis_port #(adder_transaction) bport;

    virtual dut_if dut_vi;    
    function new(string name , uvm_component parent);
        super.new(name,parent);
      endfunction

    function void build_phase(uvm_phase phase);
        bport = new("bport", this);
        if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", dut_vi))
            `uvm_error("", "uvm_config_db::get failed");
    endfunction
    task run_phase (uvm_phase phase);
        forever begin
            @(posedge dut_vi.clk)
            wait(dut_vi.enable == 1);
            req.Sum = dut_if.sum
            bport.write(req);
        end
    endtask


 endclass