
//test creating inst env

class adder_test extends uvm_test;
    `uvm_component_utils(adder_test)

    my_env my_env_h;

    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new


    //bulding my env!!!
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        my_env_h = my_env::type_id::create("my_env", this);
    endfunction: build_phase

    //run my test!!!
    task run_phase (uvm_phase phase);
       // my_sequence seq_h;
        seq_of_sequences two_seq_h;
        //seq_h = my_sequence::type_id::create("seq");
        two_seq_h = seq_of_sequences::type_id::create("seq_of_sequences");
        if( !two_seq_h.randomize() )
            `uvm_error("", "Randomize failed");

        two_seq_h.starting_phase = phase;
        phase.raise_objection(this);
        two_seq_h.start(my_env_h.agent_h.my_seqr_h, null);
        //seq_h.start(my_env_h.agent_h.my_seqr_h);
        phase.drop_objection(this);
    
    endtask 

endclass