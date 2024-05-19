.main clear
vlog -sv FA.sv my_pkg.sv top.sv uvm_interface.sv    
vopt +acc top -o opt_test
vsim opt_test
run 0
# run -all