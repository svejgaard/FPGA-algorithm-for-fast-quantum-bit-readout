#
# pin constraints
#
#
# additional constraints

# period = 6.4 ns => 156.25 MHz
create_clock -period 6.400 -name sys_clk [get_ports clk_p]


# Using USER_CLOCK_P and USER_CLOCK_N for clocks (156.25 MHz by default), see UG885 table 1-10
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_n]
set_property PACKAGE_PIN AK34 [get_ports clk_p]
set_property PACKAGE_PIN AL34 [get_ports clk_n]

# Using GPIO_SW_N for RESET, which generated reset_n signal, see UG885 table 1-26
set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_property PACKAGE_PIN AR40 [get_ports reset]

# Using GPIO_DIP_SW0 for TRIG, which generated trig signal, see UG885 table 1-26
set_property IOSTANDARD LVCMOS18 [get_ports trig]
set_property PACKAGE_PIN AV30 [get_ports trig]

# Using USER_SMA_GPIO_P for START see UG885 table 1-26
set_property IOSTANDARD LVCMOS18 [get_ports start]
set_property PACKAGE_PIN AN31 [get_ports start]

# Using USER_SMA_GPIO_N for STOP_SIG, see UG885 table 1-26
set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[0]}]
set_property PACKAGE_PIN AP31 [get_ports {stop_sig[0]}]

# Using FMC1_HPC_LA03_N and FMC1_HPC_LA08_P for STOP_SIG[1] og STOP_SIG[2], see UG885 table 1-27
set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[1]}]
set_property PACKAGE_PIN M42 [get_ports {stop_sig[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[2]}]
set_property PACKAGE_PIN M37 [get_ports {stop_sig[2]}]

set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[3]}]
set_property PACKAGE_PIN R40 [get_ports {stop_sig[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[4]}]
set_property PACKAGE_PIN K37 [get_ports {stop_sig[4]}]

set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[5]}]
set_property PACKAGE_PIN Y29 [get_ports {stop_sig[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[6]}]
set_property PACKAGE_PIN R28 [get_ports {stop_sig[6]}]

set_property IOSTANDARD LVCMOS18 [get_ports {stop_sig[7]}]
set_property PACKAGE_PIN K29 [get_ports {stop_sig[7]}]


# Using USER_LED_0 to USER_LED_7 for STATE[7:0], see UG885 table 1-26
set_property IOSTANDARD LVCMOS18 [get_ports {state[0]}]
set_property PACKAGE_PIN AM39 [get_ports {state[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[1]}]
set_property PACKAGE_PIN AN39 [get_ports {state[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[2]}]
set_property PACKAGE_PIN AR37 [get_ports {state[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[3]}]
set_property PACKAGE_PIN AT37 [get_ports {state[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[4]}]
set_property PACKAGE_PIN AR35 [get_ports {state[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[5]}]
set_property PACKAGE_PIN AP41 [get_ports {state[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[6]}]
set_property PACKAGE_PIN AP42 [get_ports {state[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {state[7]}]
set_property PACKAGE_PIN AU39 [get_ports {state[7]}]


connect_debug_port u_ila_0/probe0 [get_nets [list {p_6_out[0]} {p_6_out[1]} {p_6_out[2]} {p_6_out[3]} {p_6_out[4]} {p_6_out[5]} {p_6_out[6]} {p_6_out[7]} {p_6_out[8]} {p_6_out[9]} {p_6_out[10]} {p_6_out[11]} {p_6_out[12]} {p_6_out[13]} {p_6_out[14]} {p_6_out[15]} {p_6_out[16]} {p_6_out[17]} {p_6_out[18]} {p_6_out[19]} {p_6_out[20]} {p_6_out[21]} {p_6_out[22]} {p_6_out[23]} {p_6_out[24]} {p_6_out[25]} {p_6_out[26]} {p_6_out[27]} {p_6_out[28]} {p_6_out[29]} {p_6_out[30]} {p_6_out[31]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {p_3_out[0]} {p_3_out[1]} {p_3_out[2]} {p_3_out[3]} {p_3_out[4]} {p_3_out[5]} {p_3_out[6]} {p_3_out[7]} {p_3_out[8]} {p_3_out[9]} {p_3_out[10]} {p_3_out[11]} {p_3_out[12]} {p_3_out[13]} {p_3_out[14]} {p_3_out[15]} {p_3_out[16]} {p_3_out[17]} {p_3_out[18]} {p_3_out[19]} {p_3_out[20]} {p_3_out[21]} {p_3_out[22]} {p_3_out[23]} {p_3_out[24]} {p_3_out[25]} {p_3_out[26]} {p_3_out[27]} {p_3_out[28]} {p_3_out[29]} {p_3_out[30]} {p_3_out[31]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {result[2][0]} {result[2][1]} {result[2][2]} {result[2][3]} {result[2][4]} {result[2][5]} {result[2][6]} {result[2][7]} {result[2][8]} {result[2][9]} {result[2][10]} {result[2][11]} {result[2][12]} {result[2][13]} {result[2][14]} {result[2][15]} {result[2][16]} {result[2][17]} {result[2][18]} {result[2][19]} {result[2][20]} {result[2][21]} {result[2][22]} {result[2][23]} {result[2][24]} {result[2][25]} {result[2][26]} {result[2][27]} {result[2][28]} {result[2][29]} {result[2][30]} {result[2][31]}]]

connect_debug_port u_ila_0/probe0 [get_nets [list {QSTATE_gen[0].QST/probe0[0]} {QSTATE_gen[0].QST/probe0[1]} {QSTATE_gen[0].QST/probe0[2]} {QSTATE_gen[0].QST/probe0[3]} {QSTATE_gen[0].QST/probe0[4]} {QSTATE_gen[0].QST/probe0[5]} {QSTATE_gen[0].QST/probe0[6]} {QSTATE_gen[0].QST/probe0[7]} {QSTATE_gen[0].QST/probe0[8]} {QSTATE_gen[0].QST/probe0[9]} {QSTATE_gen[0].QST/probe0[10]} {QSTATE_gen[0].QST/probe0[11]} {QSTATE_gen[0].QST/probe0[12]} {QSTATE_gen[0].QST/probe0[13]} {QSTATE_gen[0].QST/probe0[14]} {QSTATE_gen[0].QST/probe0[15]} {QSTATE_gen[0].QST/probe0[16]} {QSTATE_gen[0].QST/probe0[17]} {QSTATE_gen[0].QST/probe0[18]} {QSTATE_gen[0].QST/probe0[19]} {QSTATE_gen[0].QST/probe0[20]} {QSTATE_gen[0].QST/probe0[21]} {QSTATE_gen[0].QST/probe0[22]} {QSTATE_gen[0].QST/probe0[23]} {QSTATE_gen[0].QST/probe0[24]} {QSTATE_gen[0].QST/probe0[25]} {QSTATE_gen[0].QST/probe0[26]} {QSTATE_gen[0].QST/probe0[27]} {QSTATE_gen[0].QST/probe0[28]} {QSTATE_gen[0].QST/probe0[29]} {QSTATE_gen[0].QST/probe0[30]} {QSTATE_gen[0].QST/probe0[31]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {p_10_out[0]} {p_10_out[1]} {p_10_out[2]} {p_10_out[3]} {p_10_out[4]} {p_10_out[5]} {p_10_out[6]} {p_10_out[7]} {p_10_out[8]} {p_10_out[9]} {p_10_out[10]} {p_10_out[11]} {p_10_out[12]} {p_10_out[13]} {p_10_out[14]} {p_10_out[15]} {p_10_out[16]} {p_10_out[17]} {p_10_out[18]} {p_10_out[19]} {p_10_out[20]} {p_10_out[21]} {p_10_out[22]} {p_10_out[23]} {p_10_out[24]} {p_10_out[25]} {p_10_out[26]} {p_10_out[27]} {p_10_out[28]} {p_10_out[29]} {p_10_out[30]} {p_10_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {p_13_out[0]} {p_13_out[1]} {p_13_out[2]} {p_13_out[3]} {p_13_out[4]} {p_13_out[5]} {p_13_out[6]} {p_13_out[7]} {p_13_out[8]} {p_13_out[9]} {p_13_out[10]} {p_13_out[11]} {p_13_out[12]} {p_13_out[13]} {p_13_out[14]} {p_13_out[15]} {p_13_out[16]} {p_13_out[17]} {p_13_out[18]} {p_13_out[19]} {p_13_out[20]} {p_13_out[21]} {p_13_out[22]} {p_13_out[23]} {p_13_out[24]} {p_13_out[25]} {p_13_out[26]} {p_13_out[27]} {p_13_out[28]} {p_13_out[29]} {p_13_out[30]} {p_13_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {p_16_out[0]} {p_16_out[1]} {p_16_out[2]} {p_16_out[3]} {p_16_out[4]} {p_16_out[5]} {p_16_out[6]} {p_16_out[7]} {p_16_out[8]} {p_16_out[9]} {p_16_out[10]} {p_16_out[11]} {p_16_out[12]} {p_16_out[13]} {p_16_out[14]} {p_16_out[15]} {p_16_out[16]} {p_16_out[17]} {p_16_out[18]} {p_16_out[19]} {p_16_out[20]} {p_16_out[21]} {p_16_out[22]} {p_16_out[23]} {p_16_out[24]} {p_16_out[25]} {p_16_out[26]} {p_16_out[27]} {p_16_out[28]} {p_16_out[29]} {p_16_out[30]} {p_16_out[31]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_BUFG]
