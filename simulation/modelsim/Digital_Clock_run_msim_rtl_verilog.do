transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code {E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code/TOP.v}
vlog -vlog01compat -work work +incdir+E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code {E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code/display_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code {E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/Code/time_control.v}

vlog -vlog01compat -work work +incdir+E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/TestBench {E:/Workspace/Quartus_17.1/2018_5_9_Digital_Clock/TestBench/tb_TOP.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxii_ver -L rtl_work -L work -voptargs="+acc"  tb_TOP

add wave *
view structure
view signals
run -all
