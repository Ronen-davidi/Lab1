
//env creating inst driver 


class my_env extends uvm_env;
`uvm_component_utils(my_env)

    my_agent agent_h;

    // Constructor
    function new(string name, uvm_component parent);
    super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent_h = my_agent::type_id::create("agent", this);
    endfunction
endclass