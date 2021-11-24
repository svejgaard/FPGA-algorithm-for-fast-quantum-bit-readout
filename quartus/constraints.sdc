## Generated SDC file "Integration.sdc"

## Copyright (C) 2019  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Intel Corporation"
## PROGRAM "Quartus Prime"
## VERSION "Version 19.2.0 Build 57 06/24/2019 SJ Pro Edition"

## DATE    "Thu Oct 29 11:36:20 2020"

##
## DEVICE  "1SM21BHU2F53E1VG"
##


#**************************************************************
# Time Information
#**************************************************************
set_time_format -unit ns -decimal_places 3


#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "100MHz"   [get_ports {clk}]



#**************************************************************
# Create Generated Clock
#**************************************************************


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************

#**************************************************************
# Set Output Delay
#**************************************************************

#**************************************************************
# Set Clock Group
#**************************************************************


#**************************************************************
# False path
#**************************************************************

# treating reset_n input pin as async signals
set_false_path -from [get_ports {reset_n}]
# treating LEDs and such as async output ports
#set_false_path -to [get_ports {s10_led[0]}]
#set_false_path -to [get_ports {s10_led[1]}]
#set_false_path -to [get_ports {s10_led[2]}]
#set_false_path -to [get_ports {s10_led[3]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************


#**************************************************************
# Set Maximum Delay
#**************************************************************


#**************************************************************
# Set Minimum Delay
#**************************************************************