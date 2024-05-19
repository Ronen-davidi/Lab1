

class adder_transaction extends uvm_sequence_item;

   rand bit [3:0] A;    // 4-bit input A
   rand bit [3:0] B; 
   rand bit enable;   // 4-bit input B

   constraint enb_c {
      enable dist {0:=1, 1:=2};
   }
  logic [4:0] Sum = 0;  // 4-bit Sum output

   function new (string name = "adder_transaction");
      super.new(name);
   endfunction

   `uvm_object_utils_begin(adder_transaction)
      `uvm_field_int(A, UVM_ALL_ON);
      `uvm_field_int(B, UVM_ALL_ON);
      `uvm_field_int(enable, UVM_ALL_ON);
      `uvm_field_int(Sum, UVM_ALL_ON);

   `uvm_object_utils_end


endclass