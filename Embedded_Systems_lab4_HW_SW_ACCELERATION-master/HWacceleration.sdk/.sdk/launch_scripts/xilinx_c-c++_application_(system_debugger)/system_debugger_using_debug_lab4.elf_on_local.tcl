connect -url tcp:127.0.0.1:3121
source C:/Users/konto/Downloads/Embedded_Systems_lab4_HW_SW_ACCELERATION-master/HWacceleration.sdk/Cortex_A9_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248650934"} -index 0
loadhw C:/Users/konto/Downloads/Embedded_Systems_lab4_HW_SW_ACCELERATION-master/HWacceleration.sdk/Cortex_A9_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248650934"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650934"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650934"} -index 0
dow C:/Users/konto/Downloads/Embedded_Systems_lab4_HW_SW_ACCELERATION-master/HWacceleration.sdk/lab4/Debug/lab4.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248650934"} -index 0
con
