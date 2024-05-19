class my_sequencer extends uvm_sequencer #(adder_transaction);
    `uvm_component_utils(my_sequencer)
    
    // Constructor
    function new(string name, uvm_component parent);
       super.new(name, parent);
    endfunction
 endclass