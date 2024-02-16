transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ProMemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/FSM.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/NextState.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/OutputSig.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/TriBuf.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ALU.v}

vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/FSM.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/NextState.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/OutputSig.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Processor_TB.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/TriBuf.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/Reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/722/Desktop/y3s1/elec2602/final/project {C:/Users/722/Desktop/y3s1/elec2602/final/project/ProMemory.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Processor_TB

add wave *
view structure
view signals
run 14 us
