onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {Source and Probe} /top_tb/DUT/SNP0/source
add wave -noupdate -group {Source and Probe} /top_tb/DUT/SNP0/probe
add wave -noupdate -expand -group Top /top_tb/DUT/clk
add wave -noupdate -expand -group Top /top_tb/DUT/reset_n
add wave -noupdate -expand -group Top /top_tb/DUT/test_trig
add wave -noupdate -expand -group Top /top_tb/DUT/start
add wave -noupdate -expand -group Top /top_tb/stop_sig
add wave -noupdate -expand -group Top /top_tb/DUT/valid
add wave -noupdate -expand -group Top /top_tb/DUT/state
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_0
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_1
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_2
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_3
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_4
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_5
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_6
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result_7
add wave -noupdate -expand -group Top /top_tb/DUT/trigger_sig
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/trig
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/enable
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/start
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/rden
add wave -noupdate -expand -group Injector -radix unsigned /top_tb/DUT/INI0/counter
add wave -noupdate -expand -group Injector -radix unsigned /top_tb/DUT/INI0/address
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/address
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/sample_A
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/sample_B
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/sample_C
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/sample_D
add wave -noupdate -expand -group Control /top_tb/DUT/QSTATE_gen(0)/QST/CON0/input_data_ready
add wave -noupdate -expand -group Control /top_tb/DUT/QSTATE_gen(0)/QST/CON0/clear_registers_n
add wave -noupdate -expand -group Control -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/CON0/address
add wave -noupdate -expand -group Control /top_tb/DUT/QSTATE_gen(0)/QST/CON0/rden
add wave -noupdate -expand -group Control /top_tb/DUT/QSTATE_gen(0)/QST/CON0/stop
add wave -noupdate -expand -group Control /top_tb/DUT/QSTATE_gen(0)/QST/CON0/valid
add wave -noupdate -group Delay /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/input_data_ready
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_in_A
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_in_B
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_in_C
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_in_D
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_A1
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_B1
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_C1
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_D1
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_A2
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_B2
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_C2
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/register_D2
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_out_A
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_out_B
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_out_C
add wave -noupdate -group Delay -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DEL0/data_out_D
add wave -noupdate -expand -group {Dot Product Module} /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/rden
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/address
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_0
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_1
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_2
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_3
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_0
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_1
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_2
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_3
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_0_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_1_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_2_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/pc_3_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_0_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_1_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_2_sfixed
add wave -noupdate -expand -group {Dot Product Module} -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/sample_3_sfixed
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/DOT0/dotproduct
add wave -noupdate -expand -group Integrator -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/INT0/input
add wave -noupdate -expand -group Integrator -radix unsigned -childformat {{/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(31) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(30) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(29) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(28) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(27) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(26) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(25) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(24) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(23) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(22) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(21) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(20) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(19) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(18) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(17) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(16) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(15) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(14) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(13) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(12) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(11) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(10) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(9) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(8) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(7) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(6) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(5) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(4) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(3) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(2) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(1) -radix unsigned} {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(0) -radix unsigned}} -subitemconfig {/top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(31) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(30) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(29) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(28) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(27) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(26) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(25) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(24) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(23) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(22) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(21) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(20) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(19) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(18) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(17) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(16) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(15) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(14) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(13) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(12) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(11) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(10) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(9) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(8) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(7) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(6) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(5) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(4) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(3) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(2) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(1) {-height 15 -radix unsigned} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral(0) {-height 15 -radix unsigned}} /top_tb/DUT/QSTATE_gen(0)/QST/INT0/integral
add wave -noupdate -expand -group Integrator -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/INT0/sum_sig
add wave -noupdate -expand -group Subtractor -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/SUB0/mean
add wave -noupdate -expand -group Subtractor -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/SUB0/input
add wave -noupdate -expand -group Subtractor -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/SUB0/result
add wave -noupdate -expand -group Subtractor -radix sfixed /top_tb/DUT/QSTATE_gen(0)/QST/SUB0/subtraction_sfixed
add wave -noupdate -group Comparator -radix unsigned /top_tb/DUT/QSTATE_gen(0)/QST/COM0/input
add wave -noupdate -group Comparator /top_tb/DUT/QSTATE_gen(0)/QST/COM0/state

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 234
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {284 ns}
