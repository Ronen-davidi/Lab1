
 
 class my_driver extends uvm_driver #(adder_transaction);
    `uvm_component_utils(my_driver);

    virtual dut_if dut_vi;

    function new(string name , uvm_component parent);
        super.new(name,parent);
      endfunction

    function void build_phase(uvm_phase phase);
        if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if", dut_vi))
            `uvm_error("", "uvm_config_db::get failed");
    endfunction

    task run_phase (uvm_phase phase);
        `uvm_info(get_type_name(), "run_phase", UVM_HIGH)
        forever begin
            seq_item_port.get_next_item(req);
            `uvm_info(get_type_name(), {"req item \n", req.sprint}, UVM_HIGH)
            fork begin
                @(posedge dut_vi.clk);
                dut_vi.a <= req.A;
                dut_vi.b <= req.B;
                dut_vi.enable <= req.enable;
            end
            begin
                @(posedge dut_vi.clk);
                wait(dut_vi.enable == 1);
                dut_vi.sum = req.Sum;
            end
            join_any   
            seq_item_port.item_done(req);
        end
    endtask

 endclass