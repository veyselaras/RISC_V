transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Program_Counter/src/Program_Counter.vhd}

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Program_Counter/src/tb_Program_Counter.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_Program_Counter

add wave *
view structure
view signals
run -all
