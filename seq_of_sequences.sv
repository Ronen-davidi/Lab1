


class seq_of_sequences extends uvm_sequence #(adder_transaction);
    `uvm_object_utils(seq_of_sequences)


    function new (string name = "seq_of_sequences");
        super.new(name);
    endfunction

    rand int count;
    constraint count_c {count > 0 && count <= 10;};
    my_sequence seq_h;
    my_sec_sequence sec_seq_h;
    


    task body;
        
        if (starting_phase != null)
            starting_phase.raise_objection(this);
        repeat(count) begin
           
            seq_h = my_sequence::type_id::create("seq1");
            seq_h.start(this.get_sequencer);
            sec_seq_h = my_sec_sequence::type_id::create("seq2");
            sec_seq_h.start(this.get_sequencer);

        end

        if(starting_phase != null)
            starting_phase.drop_objection(this);
    endtask : body
endclass

