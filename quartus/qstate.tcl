# Copyright (C) 2019  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: qstate.tcl
# Generated on: Wed Nov 24 18:03:37 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "qstate"]} {
		puts "Project qstate is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists qstate]} {
		project_open -revision qstate qstate
	} else {
		project_new -revision qstate qstate
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name TOP_LEVEL_ENTITY top
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 21.2.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "13:04:45  OCTOBER 27, 2021"
	set_global_assignment -name LAST_QUARTUS_VERSION "19.2.0 Pro Edition"
	set_global_assignment -name DEVICE 1SM21BHU2F53E1VG
	set_global_assignment -name FAMILY "Stratix 10"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim (VHDL)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name PROJECT_IP_REGENERATION_POLICY ALWAYS_REGENERATE_IP
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
	set_global_assignment -name AUTO_RESTART_CONFIGURATION OFF
	set_global_assignment -name MINIMUM_SEU_INTERVAL 0
	set_global_assignment -name USE_PWRMGT_SCL SDM_IO14
	set_global_assignment -name USE_PWRMGT_SDA SDM_IO11
	set_global_assignment -name USE_CONF_DONE SDM_IO16
	set_global_assignment -name USE_INIT_DONE SDM_IO0
	set_global_assignment -name USE_CVP_CONFDONE SDM_IO15
	set_global_assignment -name PWRMGT_SLAVE_DEVICE_TYPE OTHER
	set_global_assignment -name PWRMGT_SLAVE_DEVICE0_ADDRESS 47
	set_global_assignment -name PWRMGT_PAGE_COMMAND_ENABLE ON
	set_global_assignment -name DEVICE_INITIALIZATION_CLOCK OSC_CLK_1_125MHZ
	set_global_assignment -name SDC_FILE jtag_constraints.sdc
	set_global_assignment -name SDC_FILE constraints.sdc
	set_global_assignment -name IP_FILE intel_source_and_probe.ip
	set_global_assignment -name IP_FILE ram2048x32_0.ip
	set_global_assignment -name IP_FILE ram2048x32_1.ip
	set_global_assignment -name IP_FILE ram2048x32_2.ip
	set_global_assignment -name IP_FILE ram2048x32_3.ip
	set_global_assignment -name MIF_FILE mem0_init_file.mif
	set_global_assignment -name MIF_FILE mem1_init_file.mif
	set_global_assignment -name MIF_FILE mem2_init_file.mif
	set_global_assignment -name MIF_FILE mem3_init_file.mif
	set_global_assignment -name IP_FILE ram2x32_0.ip
	set_global_assignment -name MIF_FILE mean_mem0_init_file.mif
	set_global_assignment -name IP_FILE intel_ram2048x34_0.ip
	set_global_assignment -name IP_FILE intel_ram2048x34_1.ip
	set_global_assignment -name IP_FILE intel_ram2048x34_2.ip
	set_global_assignment -name IP_FILE intel_ram2048x34_3.ip
	set_global_assignment -name MIF_FILE injector_mem0_init_file.mif
	set_global_assignment -name MIF_FILE injector_mem1_init_file.mif
	set_global_assignment -name MIF_FILE injector_mem2_init_file.mif
	set_global_assignment -name MIF_FILE injector_mem3_init_file.mif
	set_global_assignment -name VHDL_FILE ../common/packages/data_formats.vhd
	set_global_assignment -name VHDL_FILE ../src/top.vhd
	set_global_assignment -name VHDL_FILE ../src/source_and_probe_intel.vhd
	set_global_assignment -name VHDL_FILE ../src/injector.vhd
	set_global_assignment -name VHDL_FILE ../src/qstate.vhd
	set_global_assignment -name VHDL_FILE ../src/control.vhd
	set_global_assignment -name VHDL_FILE ../src/delay.vhd
	set_global_assignment -name VHDL_FILE ../src/dot_product_module.vhd
	set_global_assignment -name VHDL_FILE ../src/pc_ram_intel.vhd
	set_global_assignment -name VHDL_FILE ../src/integrator.vhd
	set_global_assignment -name VHDL_FILE ../src/register32.vhd
	set_global_assignment -name VHDL_FILE ../src/adder.vhd
	set_global_assignment -name VHDL_FILE ../src/subtractor.vhd
	set_global_assignment -name VHDL_FILE ../src/comparator.vhd
	set_global_assignment -name ENABLE_SIGNALTAP ON
	set_global_assignment -name USE_SIGNALTAP_FILE stp_file.stp
	set_global_assignment -name SIGNALTAP_FILE stp_file.stp
	set_location_assignment PIN_AU17 -to clk
	set_instance_assignment -name IO_STANDARD LVDS -to clk -entity top
	set_location_assignment PIN_AU16 -to "clk(n)"
	set_location_assignment PIN_BL14 -to reset_n

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
