
�
Command: %s
53*	vivadotcl2T
@write_bitstream -force -no_partial_bitfile Cortex_A9_wrapper.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state[8]_i_2_n_0 is a gated clock net sourced by a combinational pin Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state[8]_i_2/O, cell Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state[8]_i_2. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLHOLDVIO-22default:default2O
;Non-Optimal connections which could lead to hold violations2default:default2�
�A LUT Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state[8]_i_2 is driving clock pin of 9 cells. This could lead to large hold time violations. First few involved cells are:
    Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state_reg[8] {FDCE}
    Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state_reg[6] {FDCE}
    Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state_reg[3] {FDCE}
    Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state_reg[5] {FDCE}
    Cortex_A9_i/led_ip/inst/led_ip_v1_0_S_AXI_inst/U1/Counter/state_reg[2] {FDCE}
2default:defaultZ23-20h px� 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 2 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
h
Writing bitstream %s...
11*	bitstream2+
./Cortex_A9_wrapper.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2�
pC:/Users/kmd17/Documents/GitHub/Embedded_Systems_lab3_CustomIP/CustomIP.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Tue Apr 04 09:43:20 20172default:default2I
5C:/Xilinx/Vivado/2016.4/doc/webtalk_introduction.html2default:defaultZ17-186h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
842default:default2
162default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:272default:default2
00:00:302default:default2
1582.5162default:default2
351.6372default:defaultZ17-268h px� 


End Record