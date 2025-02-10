transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Register_File/src/Register_File.vhd}

vcom -93 -work work {C:/RISC_V_PROJECT/Top_Level/Register_File/src/tb_Register_File.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_Register_File

add wave *
view structure
view signals
run -all
