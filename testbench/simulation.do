# tcl scripting
# in ModelSIM terminal: set COMPONENT_NAME adder

set BASE_PATH ../
set COMPONENT_PATH $BASE_PATH/src
set TESTBENCH_PATH $BASE_PATH/testbench
set PACKAGE_PATH $BASE_PATH/common/packages
set COMMON_SIMULATION_PATH $BASE_PATH/common/testbench

if { ! [info exists COMPONENT]} {
	puts "Specify the component!"
	return 1
}

if { ! [info exists IP_CORES] } {
	puts "Should IP cores be simulated?"
	return 2
}
if { $IP_CORES == 1 } {
	set QSYS_SIMDIR $BASE_PATH/quartus
	source $QSYS_SIMDIR/mentor/msim_setup.tcl
	# vcom -2008 $TESTBENCH_PATH/ram2048x32_tb.vhd


	# # Call command to compile the Quartus EDA simulation library.
 	dev_com

	# Call command to compile the Quartus-generated IP simulation files
	com	

	# # Set the top-level simulation or testbench module/entity name, which is
	# # used by the elab command to elaborate the top level.
	# #
	set TOP_LEVEL_NAME $COMPONENT\_tb
	# #
	# # Set any elaboration options you require.
	# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
	# #
	# # Call command to elaborate your design and testbench.
	# elab_debug

	# vcom -2008 $BASE_PATH/quartus/ram2048x32/sim/ram2048x32.vhd
	vcom -2008 $BASE_PATH\quartus/ram2048x32_0/sim/ram2048x32_0.vhd
	vcom -2008 $BASE_PATH\quartus/ram2048x32_1/sim/ram2048x32_1.vhd
	vcom -2008 $BASE_PATH\quartus/ram2048x32_2/sim/ram2048x32_2.vhd
	vcom -2008 $BASE_PATH\quartus/ram2048x32_3/sim/ram2048x32_3.vhd
	vcom -2008 $BASE_PATH\quartus/ram2x32_0/sim/ram2x32_0.vhd
	vcom -2008 $BASE_PATH\quartus/intel_ram2048x34_0/sim/intel_ram2048x34_0.vhd
	vcom -2008 $BASE_PATH\quartus/intel_ram2048x34_1/sim/intel_ram2048x34_1.vhd
	vcom -2008 $BASE_PATH\quartus/intel_ram2048x34_2/sim/intel_ram2048x34_2.vhd
	vcom -2008 $BASE_PATH\quartus/intel_ram2048x34_3/sim/intel_ram2048x34_3.vhd
}


# vcom -2008 $COMMON_SIMULATION_PATH/simulation_basics.vhd
vcom -2008 $PACKAGE_PATH/data_formats.vhd



if { $COMPONENT == "adder_tree_A" || $COMPONENT == "adder_tree_B"} {
	vcom -2008 $COMPONENT_PATH/adder.vhd
} 
if { $COMPONENT == "subtractor"} {
	vcom -2008 $COMPONENT_PATH/mean_register.vhd
}
if { $COMPONENT == "integrator"} {
	vcom -2008 $COMPONENT_PATH/adder.vhd
	vcom -2008 $COMPONENT_PATH/register32.vhd
}
if { $COMPONENT == "dot_product_module"} {
	vcom -2008 $COMPONENT_PATH/pc_ram_intel.vhd
	vcom -2008 $COMPONENT_PATH/adder.vhd
	vcom -2008 $COMPONENT_PATH/register32.vhd
	vcom -2008 $COMPONENT_PATH/integrator.vhd
}
if { $COMPONENT == "qstate"} {
	vcom -2008 $COMPONENT_PATH/control.vhd
	vcom -2008 $COMPONENT_PATH/delay.vhd
	vcom -2008 $COMPONENT_PATH/pc_ram_intel.vhd
	vcom -2008 $COMPONENT_PATH/dot_product_module.vhd	
	vcom -2008 $COMPONENT_PATH/adder.vhd
	vcom -2008 $COMPONENT_PATH/register32.vhd
	vcom -2008 $COMPONENT_PATH/integrator.vhd
	vcom -2008 $COMPONENT_PATH/mean_register.vhd
	vcom -2008 $COMPONENT_PATH/subtractor.vhd
	vcom -2008 $COMPONENT_PATH/comparator.vhd

}
if { $COMPONENT == "generator"} {
	vcom -2008 $BASE_PATH/quartus/intel_ram2048x130/sim/intel_ram2048x130.vhd
	vcom -2008 $COMPONENT_PATH/generator_ram_intel.vhd
}
if { $COMPONENT == "top"} {
	vcom -2008 $BASE_PATH/quartus/intel_ram2048x130/sim/intel_ram2048x130.vhd
	vcom -2008 $COMPONENT_PATH/injector.vhd

	vcom -2008 $COMPONENT_PATH/control.vhd
	vcom -2008 $COMPONENT_PATH/delay.vhd
	vcom -2008 $COMPONENT_PATH/pc_ram_intel.vhd
	vcom -2008 $COMPONENT_PATH/dot_product_module.vhd	
	vcom -2008 $COMPONENT_PATH/adder.vhd
	vcom -2008 $COMPONENT_PATH/register32.vhd
	vcom -2008 $COMPONENT_PATH/integrator.vhd
	vcom -2008 $COMPONENT_PATH/mean_register.vhd
	vcom -2008 $COMPONENT_PATH/subtractor.vhd
	vcom -2008 $COMPONENT_PATH/comparator.vhd
	vcom -2008 $COMPONENT_PATH/qstate.vhd

	vcom -2008 $BASE_PATH/quartus/intel_source_and_probe/sim/intel_source_and_probe.vhd
	vcom -2008 $COMPONENT_PATH/source_and_probe_intel.vhd
}

# the top component should be compiled AFTER all sub-files have been compiled
if { $COMPONENT != "ram2048x32" } {
	# # since .vhd files from IP cores are placed in /quartus/sim, and this is simulated in the section if IP_CORES == 1 above 
	vcom -2008 $COMPONENT_PATH/$COMPONENT.vhd
}

vcom -2008 $TESTBENCH_PATH/$COMPONENT\_tb.vhd
# vsim -t 100ps $COMPONENT\_tb
vsim -t 1ns $COMPONENT\_tb

do $TESTBENCH_PATH/$COMPONENT\_wave.do
# do $TESTBENCH_PATH/wave.do

# view structure
# view signals

if { [info exists RUN_TIME] } {
	run $RUN_TIME
} else {
	run 1us	
}