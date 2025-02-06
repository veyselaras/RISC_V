transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Program_Counter.vo}

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Program_Counter/src/tb_Program_Counter.vhd}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_Program_Counter

add wave *
view structure
view signals
run -all
