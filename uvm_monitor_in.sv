
 
 class my_monitor_in extends uvm_monitor;
    `uvm_component_utils(my_monitor);
    uvm_analysis_port #(adder_transaction) aport;

    virtual dut_if dut_vi;    
    function new(string name , uvm_component parent);
        super.new(name,parent);
      endfunction

    function void build_phase(uvm_phase phase);
        aport = new("aport", this);
        if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", dut_vi))
            `uvm_error("", "uvm_config_db::get failed");
    endfunction
    task run_phase (uvm_phase phase);
        forever begin
            @(posedge dut_vi.clk)
            wait(dut_vi.enable == 1);
            req.A = dut_vi.a;
            req.B = dut_vi.b;
            aport.write(req);
        end
    endtask


 endclass