class my_agent_out extends uvm_agent;
    `uvm_component_utils(my_agent_out)

    my_monitor_out my_monitor_out_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    //buliding my driver !!!
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        bport = new("bport", this);
        my_monitor_out_h = my_monitor_out::type_id::create("uvm_monitor_out", this);
    endfunction:build_phase


    //agent
    function void connect_phase(uvm_phase phase);
        //my_monitor_out_h.bport.connect(my_scoreboard.scb_bport);
    endfunction

endclass