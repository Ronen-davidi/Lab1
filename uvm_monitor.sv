
 
 class my_monitor extends uvm_monitor;
    `uvm_component_utils(my_monitor);

    virtual dut_if dut_vi;

    function new(string name , uvm_component parent);
        super.new(name,parent);
      endfunction

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", dut_vi))
            `uvm_error("", "uvm_config_db::get failed");
    endfunction
    task run_phase (uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            
            @(posedge dut_vi.clk);
            wait(dut_vi.enable == 1);
            req.A <= dut_vi.a;
            req.B <= dut_vi.b;

            seq_item_port.item_done(req);
        end
    endtask


 endclass