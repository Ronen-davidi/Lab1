

class my_sec_sequence extends uvm_sequence #(adder_transaction);
    `uvm_object_utils(my_sec_sequence)

    function new (string name = "my_sec_sequence");
        super.new(name);
    endfunction

    task body;
        if (starting_phase != null)
            starting_phase.raise_objection(this);

            req = adder_transaction::type_id::create("req");
            
            
            start_item(req);
            req.A = 1;
            if( !req.randomize() )
                `uvm_error("", "Randomize failed!!")
                req.print();
            finish_item(req);

        if(starting_phase != null)
            starting_phase.drop_objection(this);
    endtask : body
endclass