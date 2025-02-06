transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Instruction_Memory/src/Instruction_Memory.vhd}

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Instruction_Memory/src/tb_Instruction_Memory.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_Instruction_Memory

add wave *
view structure
view signals
run -all
