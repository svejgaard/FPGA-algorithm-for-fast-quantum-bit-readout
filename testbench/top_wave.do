onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {Source and Probe} /top_tb/DUT/SNP0/source
add wave -noupdate -group {Source and Probe} /top_tb/DUT/SNP0/probe
add wave -noupdate -expand -group Top /top_tb/DUT/clk
add wave -noupdate -expand -group Top /top_tb/DUT/reset_n
add wave -noupdate -expand -group Top /top_tb/DUT/test_trig
add wave -noupdate -expand -group Top /top_tb/DUT/start
add wave -noupdate -expand -group Top /top_tb/DUT/stop
add wave -noupdate -expand -group Top /top_tb/DUT/valid
add wave -noupdate -expand -group Top /top_tb/DUT/state
add wave -noupdate -expand -group Top -radix hexadecimal /top_tb/DUT/result
add wave -noupdate -expand -group Top /top_tb/DUT/trigger_sig
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/trig
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/enable
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/start
add wave -noupdate -expand -group Injector /top_tb/DUT/INI0/rden
add wave -noupdate -expand -group Injector -radix unsigned /top_tb/DUT/INI0/counter
add wave -noupdate -expand -group Injector -radix unsigned /top_tb/DUT/INI0/address
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QST0/address
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QST0/sample_A
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QST0/sample_B
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QST0/sample_C
add wave -noupdate -expand -group QState -radix unsigned /top_tb/DUT/QST0/sample_D
add wave -noupdate -expand -group Control /top_tb/DUT/QST0/CON0/input_data_ready
add wave -noupdate -expand -group Control /top_tb/DUT/QST0/CON0/clear_registers_n
add wave -noupdate -expand -group Control -radix unsigned /top_tb/DUT/QST0/CON0/address
add wave -noupdate -expand -group Control /top_tb/DUT/QST0/CON0/rden
add wave -noupdate -expand -group Control /top_tb/DUT/QST0/CON0/stop
add wave -noupdate -expand -group Control /top_tb/DUT/QST0/CON0/valid
add wave -noupdate -expand -group Delay /top_tb/DUT/QST0/DEL0/input_data_ready
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_in_A
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_in_B
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_in_C
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_in_D
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_A1
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_B1
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_C1
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_D1
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_A2
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_B2
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_C2
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/register_D2
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_out_A
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_out_B
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_out_C
add wave -noupdate -expand -group Delay -radix unsigned /top_tb/DUT/QST0/DEL0/data_out_D
add wave -noupdate -expand -group {Dot Product Module} /top_tb/DUT/QST0/DOT0/rden
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/address
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/sample_0
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/sample_1
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/sample_2
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/sample_3
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/pc_0
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/pc_1
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/pc_2
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/pc_3
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/pc_0_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/pc_1_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/pc_2_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/pc_3_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/sample_0_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/sample_1_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/sample_2_sfixed
add wave -noupdate -expand -group {Dot Product Module} -expand -group {Clocked => 1 clk delayed} -radix sfixed /top_tb/DUT/QST0/DOT0/sample_3_sfixed
add wave -noupdate -expand -group {Dot Product Module} -radix unsigned /top_tb/DUT/QST0/DOT0/dotproduct
add wave -noupdate -expand -group Integrator -radix unsigned /top_tb/DUT/QST0/INT0/integral
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49400 ns} 0}
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
WaveRestoreZoom {49252 ns} {49536 ns}
