class my_agent extends uvm_agent;
    `uvm_component_utils(my_agent)

    my_driver my_driver_h;
    my_sequencer my_seqr_h;
    //my_monitor my_monitor_h;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    //buliding my driver !!!
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        my_driver_h = my_driver::type_id::create("uvm_driver", this);
        my_seqr_h =   my_sequencer::type_id::create("my_sequencer", this);
       // my_monitor_h = my_monitor::type_id::create("uvm_monitor", this);
    endfunction:build_phase


    //agent
    function void connect_phase(uvm_phase phase);
        my_driver_h.seq_item_port.connect(my_seqr_h.seq_item_export);
       // my_monitor_h.seq_item_port.connect(my_monitor_h.seq_item_export);
    endfunction

endclass