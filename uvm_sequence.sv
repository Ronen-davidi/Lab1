

class my_sequence extends uvm_sequence #(adder_transaction);
    `uvm_object_utils(my_sequence)

    function new (string name = "my_sequence");
        super.new(name);
    endfunction

    task body;
        if (starting_phase != null)
            starting_phase.raise_objection(this);

        repeat(8) begin
            req = adder_transaction::type_id::create("req");
            
            start_item(req);

            if( !req.randomize() )
                `uvm_error("", "Randomize failed!!")
                req.print();
            finish_item(req);

        end


        if(starting_phase != null)
            starting_phase.drop_objection(this);
    endtask : body
endclass