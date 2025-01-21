set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { Red[0] }]; IO_L8N_T1_AD14N_35 Sch= Red[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { Red[1] }]; IO_L7N_T1_AD6N_35 Sch=Red[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { Red[2] }]; IO_L1N_T0_AD4N_35 Sch=Red[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { Red[3] }]; IO_L8P_T1_AD14P_35 Sch=Red[3]

set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { Green[0] }]; IO_L1P_T0_AD4P_35 Sch=Green[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { Green[1] }]; IO_L3N_T0_DQS_AD5N_35 Sch=Green[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { Green[2] }]; IO_L2N_T0_AD12N_35 Sch=Green[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { Green[3] }]; IO_L3P_T0_DQS_AD5P_35 Sch=Green[3]

set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { Blue[0] }]; IO_L2P_T0_AD12P_35 Sch=Blue[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { Blue[1] }]; IO_L4N_T0_35 Sch=Blue[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { Blue[2] }]; IO_L6N_T0_VREF_35 Sch=Blue[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { Blue[3] }]; IO_L4P_T0_35 Sch=Blue[3]

set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { h_sync }]; IO_L4P_T0_15 Sch=h_sync
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { v_sync }]; IO_L3N_T0_DQS_AD1N_15 Sch=v_sync

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; IO_L12P_T1_MRCC_35 Sch=clk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { button }]; IO_L9P_T1_DQS_14 Sch=button


set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { cat[6] }]; IO_L24N_T3_A00_D16_14 Sch=cat[6]
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { cat[5] }]; IO_25_14 Sch=cat[5]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { cat[4] }]; IO_25_15 Sch=cat[4]
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { cat[3]}]; IO_L17P_T2_A26_15 Sch=cat[3]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { cat[2]}]; IO_L13P_T2_MRCC_14 Sch=cat[2]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { cat[1] }]; IO_L19P_T3_A10_D26_14 Sch=cat[1]
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { cat[0] }]; IO_L4P_T0_D04_14 Sch=cat[0]

#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp

set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { an[0] }]; IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { an[1] }]; IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { an[2] }]; IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { an[3] }]; IO_L19P_T3_A22_15 Sch=an[3]