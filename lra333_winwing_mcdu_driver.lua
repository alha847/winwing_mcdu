--Lua script to sync the buttons, switches, LEDs and LCDs of the Winwing MCDU with XP12. 
--Designed for the default LR A333 airplane, captain's MCDU. MCDU of FO and observer not supported yet.

--Tested on a MacBook M1 Pro with macOS 15.4.1, XP12.2.0 beta 5, FlyWithLua NG+ 2.8.12.

--The device should be connected before starting XP12. Otherwise, or in the case the USB connection gets lost, 
--please restart this script, instructions see section "Config" below. 

--alha847, May 2025
--v0.8
--Preliminary version: not everything is supported or fully working 
--No tests have been carried out whether this script is compatible with my FCU/EFIS lua script

----------------------- Config -----------------------

--todo, e.g. default display brightness, button backlight, colors

----------------------- Datarefs -----------------------

--sources: e.g. A333.systems.lua, A333.switches.lua
--general
dataref("integ_light_brightness", "sim/cockpit2/switches/instrument_brightness_ratio", "readonly", 13)
dataref("capt_brightness", "sim/cockpit2/switches/instrument_brightness_ratio", "readonly", 6) --brightness of MCDU CAPT, 0...1
--MCDU CAPTAIN
--text all lines
dataref("capt_text0", "sim/cockpit2/radios/indicators/fms_cdu1_text_line0", "readonly") 
dataref("capt_text1", "sim/cockpit2/radios/indicators/fms_cdu1_text_line1", "readonly")
dataref("capt_text2", "sim/cockpit2/radios/indicators/fms_cdu1_text_line2", "readonly")
dataref("capt_text3", "sim/cockpit2/radios/indicators/fms_cdu1_text_line3", "readonly")
dataref("capt_text4", "sim/cockpit2/radios/indicators/fms_cdu1_text_line4", "readonly")
dataref("capt_text5", "sim/cockpit2/radios/indicators/fms_cdu1_text_line5", "readonly")
dataref("capt_text6", "sim/cockpit2/radios/indicators/fms_cdu1_text_line6", "readonly")
dataref("capt_text7", "sim/cockpit2/radios/indicators/fms_cdu1_text_line7", "readonly")
dataref("capt_text8", "sim/cockpit2/radios/indicators/fms_cdu1_text_line8", "readonly")
dataref("capt_text9", "sim/cockpit2/radios/indicators/fms_cdu1_text_line9", "readonly")
dataref("capt_text10", "sim/cockpit2/radios/indicators/fms_cdu1_text_line10", "readonly")
dataref("capt_text11", "sim/cockpit2/radios/indicators/fms_cdu1_text_line11", "readonly")
dataref("capt_text12", "sim/cockpit2/radios/indicators/fms_cdu1_text_line12", "readonly")
dataref("capt_text13", "sim/cockpit2/radios/indicators/fms_cdu1_text_line13", "readonly")
--style line 0
dataref("capt_style0_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",0)
dataref("capt_style0_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",1)
dataref("capt_style0_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",2)
dataref("capt_style0_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",3)
dataref("capt_style0_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",4)
dataref("capt_style0_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",5)
dataref("capt_style0_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",6)
dataref("capt_style0_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",7)
dataref("capt_style0_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",8)
dataref("capt_style0_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",9)
dataref("capt_style0_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",10)
dataref("capt_style0_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",11)
dataref("capt_style0_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",12)
dataref("capt_style0_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",13)
dataref("capt_style0_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",14)
dataref("capt_style0_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",15)
dataref("capt_style0_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",16)
dataref("capt_style0_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",17)
dataref("capt_style0_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",18)
dataref("capt_style0_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",19)
dataref("capt_style0_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",20)
dataref("capt_style0_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",21)
dataref("capt_style0_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",22)
dataref("capt_style0_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line0", "readonly",23)
--style line 1
dataref("capt_style1_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",0)
dataref("capt_style1_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",1)
dataref("capt_style1_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",2)
dataref("capt_style1_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",3)
dataref("capt_style1_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",4)
dataref("capt_style1_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",5)
dataref("capt_style1_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",6)
dataref("capt_style1_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",7)
dataref("capt_style1_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",8)
dataref("capt_style1_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",9)
dataref("capt_style1_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",10)
dataref("capt_style1_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",11)
dataref("capt_style1_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",12)
dataref("capt_style1_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",13)
dataref("capt_style1_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",14)
dataref("capt_style1_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",15)
dataref("capt_style1_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",16)
dataref("capt_style1_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",17)
dataref("capt_style1_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",18)
dataref("capt_style1_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",19)
dataref("capt_style1_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",20)
dataref("capt_style1_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",21)
dataref("capt_style1_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",22)
dataref("capt_style1_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line1", "readonly",23)
--style line 2
dataref("capt_style2_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",0)
dataref("capt_style2_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",1)
dataref("capt_style2_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",2)
dataref("capt_style2_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",3)
dataref("capt_style2_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",4)
dataref("capt_style2_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",5)
dataref("capt_style2_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",6)
dataref("capt_style2_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",7)
dataref("capt_style2_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",8)
dataref("capt_style2_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",9)
dataref("capt_style2_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",10)
dataref("capt_style2_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",11)
dataref("capt_style2_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",12)
dataref("capt_style2_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",13)
dataref("capt_style2_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",14)
dataref("capt_style2_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",15)
dataref("capt_style2_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",16)
dataref("capt_style2_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",17)
dataref("capt_style2_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",18)
dataref("capt_style2_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",19)
dataref("capt_style2_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",20)
dataref("capt_style2_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",21)
dataref("capt_style2_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",22)
dataref("capt_style2_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line2", "readonly",23)
--style line 3
dataref("capt_style3_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",0)
dataref("capt_style3_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",1)
dataref("capt_style3_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",2)
dataref("capt_style3_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",3)
dataref("capt_style3_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",4)
dataref("capt_style3_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",5)
dataref("capt_style3_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",6)
dataref("capt_style3_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",7)
dataref("capt_style3_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",8)
dataref("capt_style3_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",9)
dataref("capt_style3_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",10)
dataref("capt_style3_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",11)
dataref("capt_style3_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",12)
dataref("capt_style3_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",13)
dataref("capt_style3_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",14)
dataref("capt_style3_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",15)
dataref("capt_style3_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",16)
dataref("capt_style3_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",17)
dataref("capt_style3_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",18)
dataref("capt_style3_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",19)
dataref("capt_style3_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",20)
dataref("capt_style3_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",21)
dataref("capt_style3_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",22)
dataref("capt_style3_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line3", "readonly",23)
--style line 4
dataref("capt_style4_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",0)
dataref("capt_style4_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",1)
dataref("capt_style4_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",2)
dataref("capt_style4_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",3)
dataref("capt_style4_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",4)
dataref("capt_style4_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",5)
dataref("capt_style4_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",6)
dataref("capt_style4_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",7)
dataref("capt_style4_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",8)
dataref("capt_style4_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",9)
dataref("capt_style4_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",10)
dataref("capt_style4_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",11)
dataref("capt_style4_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",12)
dataref("capt_style4_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",13)
dataref("capt_style4_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",14)
dataref("capt_style4_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",15)
dataref("capt_style4_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",16)
dataref("capt_style4_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",17)
dataref("capt_style4_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",18)
dataref("capt_style4_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",19)
dataref("capt_style4_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",20)
dataref("capt_style4_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",21)
dataref("capt_style4_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",22)
dataref("capt_style4_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line4", "readonly",23)
--style line 5
dataref("capt_style5_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",0)
dataref("capt_style5_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",1)
dataref("capt_style5_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",2)
dataref("capt_style5_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",3)
dataref("capt_style5_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",4)
dataref("capt_style5_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",5)
dataref("capt_style5_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",6)
dataref("capt_style5_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",7)
dataref("capt_style5_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",8)
dataref("capt_style5_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",9)
dataref("capt_style5_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",10)
dataref("capt_style5_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",11)
dataref("capt_style5_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",12)
dataref("capt_style5_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",13)
dataref("capt_style5_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",14)
dataref("capt_style5_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",15)
dataref("capt_style5_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",16)
dataref("capt_style5_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",17)
dataref("capt_style5_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",18)
dataref("capt_style5_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",19)
dataref("capt_style5_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",20)
dataref("capt_style5_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",21)
dataref("capt_style5_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",22)
dataref("capt_style5_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line5", "readonly",23)
--style line 6
dataref("capt_style6_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",0)
dataref("capt_style6_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",1)
dataref("capt_style6_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",2)
dataref("capt_style6_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",3)
dataref("capt_style6_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",4)
dataref("capt_style6_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",5)
dataref("capt_style6_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",6)
dataref("capt_style6_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",7)
dataref("capt_style6_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",8)
dataref("capt_style6_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",9)
dataref("capt_style6_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",10)
dataref("capt_style6_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",11)
dataref("capt_style6_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",12)
dataref("capt_style6_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",13)
dataref("capt_style6_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",14)
dataref("capt_style6_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",15)
dataref("capt_style6_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",16)
dataref("capt_style6_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",17)
dataref("capt_style6_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",18)
dataref("capt_style6_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",19)
dataref("capt_style6_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",20)
dataref("capt_style6_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",21)
dataref("capt_style6_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",22)
dataref("capt_style6_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line6", "readonly",23)
--style line 7
dataref("capt_style7_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",0)
dataref("capt_style7_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",1)
dataref("capt_style7_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",2)
dataref("capt_style7_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",3)
dataref("capt_style7_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",4)
dataref("capt_style7_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",5)
dataref("capt_style7_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",6)
dataref("capt_style7_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",7)
dataref("capt_style7_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",8)
dataref("capt_style7_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",9)
dataref("capt_style7_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",10)
dataref("capt_style7_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",11)
dataref("capt_style7_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",12)
dataref("capt_style7_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",13)
dataref("capt_style7_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",14)
dataref("capt_style7_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",15)
dataref("capt_style7_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",16)
dataref("capt_style7_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",17)
dataref("capt_style7_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",18)
dataref("capt_style7_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",19)
dataref("capt_style7_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",20)
dataref("capt_style7_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",21)
dataref("capt_style7_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",22)
dataref("capt_style7_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line7", "readonly",23)
--style line 8
dataref("capt_style8_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",0)
dataref("capt_style8_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",1)
dataref("capt_style8_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",2)
dataref("capt_style8_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",3)
dataref("capt_style8_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",4)
dataref("capt_style8_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",5)
dataref("capt_style8_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",6)
dataref("capt_style8_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",7)
dataref("capt_style8_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",8)
dataref("capt_style8_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",9)
dataref("capt_style8_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",10)
dataref("capt_style8_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",11)
dataref("capt_style8_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",12)
dataref("capt_style8_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",13)
dataref("capt_style8_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",14)
dataref("capt_style8_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",15)
dataref("capt_style8_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",16)
dataref("capt_style8_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",17)
dataref("capt_style8_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",18)
dataref("capt_style8_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",19)
dataref("capt_style8_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",20)
dataref("capt_style8_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",21)
dataref("capt_style8_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",22)
dataref("capt_style8_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line8", "readonly",23)
--style line 9
dataref("capt_style9_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",0)
dataref("capt_style9_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",1)
dataref("capt_style9_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",2)
dataref("capt_style9_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",3)
dataref("capt_style9_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",4)
dataref("capt_style9_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",5)
dataref("capt_style9_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",6)
dataref("capt_style9_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",7)
dataref("capt_style9_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",8)
dataref("capt_style9_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",9)
dataref("capt_style9_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",10)
dataref("capt_style9_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",11)
dataref("capt_style9_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",12)
dataref("capt_style9_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",13)
dataref("capt_style9_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",14)
dataref("capt_style9_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",15)
dataref("capt_style9_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",16)
dataref("capt_style9_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",17)
dataref("capt_style9_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",18)
dataref("capt_style9_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",19)
dataref("capt_style9_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",20)
dataref("capt_style9_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",21)
dataref("capt_style9_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",22)
dataref("capt_style9_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line9", "readonly",23)
--style line 10
dataref("capt_style10_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",0)
dataref("capt_style10_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",1)
dataref("capt_style10_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",2)
dataref("capt_style10_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",3)
dataref("capt_style10_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",4)
dataref("capt_style10_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",5)
dataref("capt_style10_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",6)
dataref("capt_style10_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",7)
dataref("capt_style10_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",8)
dataref("capt_style10_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",9)
dataref("capt_style10_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",10)
dataref("capt_style10_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",11)
dataref("capt_style10_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",12)
dataref("capt_style10_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",13)
dataref("capt_style10_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",14)
dataref("capt_style10_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",15)
dataref("capt_style10_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",16)
dataref("capt_style10_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",17)
dataref("capt_style10_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",18)
dataref("capt_style10_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",19)
dataref("capt_style10_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",20)
dataref("capt_style10_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",21)
dataref("capt_style10_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",22)
dataref("capt_style10_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line10", "readonly",23)
--style line 11
dataref("capt_style11_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",0)
dataref("capt_style11_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",1)
dataref("capt_style11_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",2)
dataref("capt_style11_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",3)
dataref("capt_style11_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",4)
dataref("capt_style11_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",5)
dataref("capt_style11_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",6)
dataref("capt_style11_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",7)
dataref("capt_style11_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",8)
dataref("capt_style11_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",9)
dataref("capt_style11_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",10)
dataref("capt_style11_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",11)
dataref("capt_style11_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",12)
dataref("capt_style11_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",13)
dataref("capt_style11_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",14)
dataref("capt_style11_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",15)
dataref("capt_style11_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",16)
dataref("capt_style11_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",17)
dataref("capt_style11_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",18)
dataref("capt_style11_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",19)
dataref("capt_style11_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",20)
dataref("capt_style11_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",21)
dataref("capt_style11_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",22)
dataref("capt_style11_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line11", "readonly",23)
--style line 12
dataref("capt_style12_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",0)
dataref("capt_style12_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",1)
dataref("capt_style12_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",2)
dataref("capt_style12_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",3)
dataref("capt_style12_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",4)
dataref("capt_style12_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",5)
dataref("capt_style12_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",6)
dataref("capt_style12_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",7)
dataref("capt_style12_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",8)
dataref("capt_style12_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",9)
dataref("capt_style12_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",10)
dataref("capt_style12_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",11)
dataref("capt_style12_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",12)
dataref("capt_style12_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",13)
dataref("capt_style12_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",14)
dataref("capt_style12_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",15)
dataref("capt_style12_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",16)
dataref("capt_style12_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",17)
dataref("capt_style12_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",18)
dataref("capt_style12_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",19)
dataref("capt_style12_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",20)
dataref("capt_style12_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",21)
dataref("capt_style12_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",22)
dataref("capt_style12_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line12", "readonly",23)
--style line 13
dataref("capt_style13_0", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",0)
dataref("capt_style13_1", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",1)
dataref("capt_style13_2", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",2)
dataref("capt_style13_3", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",3)
dataref("capt_style13_4", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",4)
dataref("capt_style13_5", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",5)
dataref("capt_style13_6", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",6)
dataref("capt_style13_7", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",7)
dataref("capt_style13_8", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",8)
dataref("capt_style13_9", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",9)
dataref("capt_style13_10", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",10)
dataref("capt_style13_11", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",11)
dataref("capt_style13_12", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",12)
dataref("capt_style13_13", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",13)
dataref("capt_style13_14", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",14)
dataref("capt_style13_15", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",15)
dataref("capt_style13_16", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",16)
dataref("capt_style13_17", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",17)
dataref("capt_style13_18", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",18)
dataref("capt_style13_19", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",19)
dataref("capt_style13_20", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",20)
dataref("capt_style13_21", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",21)
dataref("capt_style13_22", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",22)
dataref("capt_style13_23", "sim/cockpit2/radios/indicators/fms_cdu1_style_line13", "readonly",23)
--MCDU FO
--MCDU OBSERVER

cache_data={}
--general
cache_data["capt_brightness"] = 0
cache_data["integ_light_brightness"] = 0
--MCDU CAPT
cache_data["capt_text0"] = ""
cache_data["capt_text1"] = ""
cache_data["capt_text2"] = ""
cache_data["capt_text3"] = ""
cache_data["capt_text4"] = ""
cache_data["capt_text5"] = ""
cache_data["capt_text6"] = ""
cache_data["capt_text7"] = ""
cache_data["capt_text8"] = ""
cache_data["capt_text9"] = ""
cache_data["capt_text10"] = ""
cache_data["capt_text11"] = ""
cache_data["capt_text12"] = ""
cache_data["capt_text13"] = ""
--MCDU FO
--MCDU OBSERVER

----------------------- Buttons, switches, knobs -----------------------

--MCDU CAPT
btn_cpt = {}
btn_cpt["L1"] = {active = false, command="sim/FMS/ls_1l", byte = 3, bitval = 0x01, last_active = false}
btn_cpt["L2"] = {active = false, command="sim/FMS/ls_2l", byte = 3, bitval = 0x02, last_active = false}
btn_cpt["L3"] = {active = false, command="sim/FMS/ls_3l", byte = 3, bitval = 0x04, last_active = false}
btn_cpt["L4"] = {active = false, command="sim/FMS/ls_4l", byte = 3, bitval = 0x08, last_active = false}
btn_cpt["L5"] = {active = false, command="sim/FMS/ls_5l", byte = 3, bitval = 0x10, last_active = false}
btn_cpt["L6"] = {active = false, command="sim/FMS/ls_6l", byte = 3, bitval = 0x20, last_active = false}
btn_cpt["R1"] = {active = false, command="sim/FMS/ls_1r", byte = 3, bitval = 0x40, last_active = false}
btn_cpt["R2"] = {active = false, command="sim/FMS/ls_2r", byte = 3, bitval = 0x80, last_active = false}
btn_cpt["R3"] = {active = false, command="sim/FMS/ls_3r", byte = 4, bitval = 0x01, last_active = false}
btn_cpt["R4"] = {active = false, command="sim/FMS/ls_4r", byte = 4, bitval = 0x02, last_active = false}
btn_cpt["R5"] = {active = false, command="sim/FMS/ls_5r", byte = 4, bitval = 0x04, last_active = false}
btn_cpt["R6"] = {active = false, command="sim/FMS/ls_6r", byte = 4, bitval = 0x08, last_active = false}
btn_cpt["DIR"] = {active = false, command="sim/FMS/dir_intc", byte = 4, bitval = 0x10, last_active = false}
btn_cpt["PROG"] = {active = false, command="sim/FMS/prog", byte = 4, bitval = 0x20, last_active = false}
btn_cpt["PERF"] = {active = false, command="sim/FMS/perf", byte = 4, bitval = 0x40, last_active = false}
btn_cpt["INIT"] = {active = false, command="sim/FMS/index", byte = 4, bitval = 0x80, last_active = false}
btn_cpt["DATA"] = {active = false, command="sim/FMS/data", byte = 5, bitval = 0x01, last_active = false}
--empty
btn_cpt["BRT"] = {active = false, command="laminar/A333/buttons/fms1_brightness_up", byte = 5, bitval = 0x04, last_active = false} --press&hold not implemented in the sim
btn_cpt["FPLN"] = {active = false, command="sim/FMS/fpln", byte = 5, bitval = 0x08, last_active = false}
btn_cpt["RAD_NAV"] = {active = false, command="sim/FMS/navrad", byte = 5, bitval = 0x10, last_active = false}
btn_cpt["FUEL_PRED"] = {active = false, command="sim/FMS/fuel_pred", byte = 5, bitval = 0x20, last_active = false}
--sec: not implemented in the sim
--atc: not implemented in the sim
btn_cpt["MENU"] = {active = false, command="sim/FMS/menu", byte = 6, bitval = 0x01, last_active = false}
btn_cpt["DIM"] = {active = false, command="laminar/A333/buttons/fms1_brightness_dn", byte = 6, bitval = 0x02, last_active = false} --press&hold not implemented in the sim
btn_cpt["AIR_PORT"] = {active = false, command="sim/FMS/airport", byte = 6, bitval = 0x04, last_active = false}
--empty
btn_cpt["ARROW_LEFT"] = {active = false, command="sim/FMS/prev", byte = 6, bitval = 0x10, last_active = false} 
btn_cpt["ARROW_UP"] = {active = false, command="sim/FMS/up", byte = 6, bitval = 0x20, last_active = false}
btn_cpt["ARROW_RIGHT"] = {active = false, command="sim/FMS/next", byte = 6, bitval = 0x40, last_active = false}
btn_cpt["ARROW_DOWN"] = {active = false, command="sim/FMS/down", byte = 6, bitval = 0x80, last_active = false}
btn_cpt["1"] = {active = false, command="sim/FMS/key_1", byte = 7, bitval = 0x01, last_active = false}
btn_cpt["2"] = {active = false, command="sim/FMS/key_2", byte = 7, bitval = 0x02, last_active = false}
btn_cpt["3"] = {active = false, command="sim/FMS/key_3", byte = 7, bitval = 0x04, last_active = false}
btn_cpt["4"] = {active = false, command="sim/FMS/key_4", byte = 7, bitval = 0x08, last_active = false}
btn_cpt["5"] = {active = false, command="sim/FMS/key_5", byte = 7, bitval = 0x10, last_active = false}
btn_cpt["6"] = {active = false, command="sim/FMS/key_6", byte = 7, bitval = 0x20, last_active = false}
btn_cpt["7"] = {active = false, command="sim/FMS/key_7", byte = 7, bitval = 0x40, last_active = false}
btn_cpt["8"] = {active = false, command="sim/FMS/key_8", byte = 7, bitval = 0x80, last_active = false}
btn_cpt["9"] = {active = false, command="sim/FMS/key_9", byte = 8, bitval = 0x01, last_active = false}
btn_cpt["PERIOD"] = {active = false, command="sim/FMS/key_period", byte = 8, bitval = 0x02, last_active = false}
btn_cpt["0"] = {active = false, command="sim/FMS/key_0", byte = 8, bitval = 0x04, last_active = false}
btn_cpt["PLUS_MINUS"] = {active = false, command="sim/FMS/key_minus", byte = 8, bitval = 0x08, last_active = false}
btn_cpt["A"] = {active = false, command="sim/FMS/key_A", byte = 8, bitval = 0x10, last_active = false}
btn_cpt["B"] = {active = false, command="sim/FMS/key_B", byte = 8, bitval = 0x20, last_active = false}
btn_cpt["C"] = {active = false, command="sim/FMS/key_C", byte = 8, bitval = 0x40, last_active = false}
btn_cpt["D"] = {active = false, command="sim/FMS/key_D", byte = 8, bitval = 0x80, last_active = false}
btn_cpt["E"] = {active = false, command="sim/FMS/key_E", byte = 9, bitval = 0x01, last_active = false}
btn_cpt["F"] = {active = false, command="sim/FMS/key_F", byte = 9, bitval = 0x02, last_active = false}
btn_cpt["G"] = {active = false, command="sim/FMS/key_G", byte = 9, bitval = 0x04, last_active = false}
btn_cpt["H"] = {active = false, command="sim/FMS/key_H", byte = 9, bitval = 0x08, last_active = false}
btn_cpt["I"] = {active = false, command="sim/FMS/key_I", byte = 9, bitval = 0x10, last_active = false}
btn_cpt["J"] = {active = false, command="sim/FMS/key_J", byte = 9, bitval = 0x20, last_active = false}
btn_cpt["K"] = {active = false, command="sim/FMS/key_K", byte = 9, bitval = 0x40, last_active = false}
btn_cpt["L"] = {active = false, command="sim/FMS/key_L", byte = 9, bitval = 0x80, last_active = false}
btn_cpt["M"] = {active = false, command="sim/FMS/key_M", byte = 10, bitval = 0x01, last_active = false}
btn_cpt["N"] = {active = false, command="sim/FMS/key_N", byte = 10, bitval = 0x02, last_active = false}
btn_cpt["O"] = {active = false, command="sim/FMS/key_O", byte = 10, bitval = 0x04, last_active = false}
btn_cpt["P"] = {active = false, command="sim/FMS/key_P", byte = 10, bitval = 0x08, last_active = false}
btn_cpt["Q"] = {active = false, command="sim/FMS/key_Q", byte = 10, bitval = 0x10, last_active = false}
btn_cpt["R"] = {active = false, command="sim/FMS/key_R", byte = 10, bitval = 0x20, last_active = false}
btn_cpt["S"] = {active = false, command="sim/FMS/key_S", byte = 10, bitval = 0x40, last_active = false}
btn_cpt["T"] = {active = false, command="sim/FMS/key_T", byte = 10, bitval = 0x80, last_active = false}
btn_cpt["U"] = {active = false, command="sim/FMS/key_U", byte = 11, bitval = 0x01, last_active = false}
btn_cpt["V"] = {active = false, command="sim/FMS/key_V", byte = 11, bitval = 0x02, last_active = false}
btn_cpt["W"] = {active = false, command="sim/FMS/key_W", byte = 11, bitval = 0x04, last_active = false}
btn_cpt["X"] = {active = false, command="sim/FMS/key_X", byte = 11, bitval = 0x08, last_active = false}
btn_cpt["Y"] = {active = false, command="sim/FMS/key_Y", byte = 11, bitval = 0x10, last_active = false}
btn_cpt["Z"] = {active = false, command="sim/FMS/key_Z", byte = 11, bitval = 0x20, last_active = false}
btn_cpt["SLASH"] = {active = false, command="sim/FMS/key_slash", byte = 11, bitval = 0x40, last_active = false}
btn_cpt["SP"] = {active = false, command="sim/FMS/key_space", byte = 11, bitval = 0x80, last_active = false}
btn_cpt["OVFY"] = {active = false, command="sim/FMS/key_overfly", byte = 12, bitval = 0x01, last_active = false}
btn_cpt["CLR"] = {active = false, command="sim/FMS/key_clear", byte = 12, bitval = 0x02, last_active = false} --todo press and hold CLR not working yet

--MCDU FO
btn_fo = {}

--MCDU OBSERVER
btn_obs = {}

function config_switches(devName, deviceData)

    --logMsg("devName = "..devName)
    --logMsg("device data byte x = "..deviceData[8])

    --Get buttons configured for the desired device
    local currentButtons = winwing_device[devName].buttons

    --Check if button was updated 
    for btnName,currBtn in pairs(currentButtons) do
        currBtn.active = isBitSet(deviceData[currBtn.byte], currBtn.bitval)
        --debug
        --if(btnName == "MAP_VOR_L") then
        --    debug logMsg("MAP_VOR_L")
        --    logMsg("curr = "..tostring(currBtn.active))
        --    logMsg("last = "..tostring(currBtn.last_active))
        --end
        if(currBtn.active and not currBtn.last_active) then
            command_once(currBtn.command)
            currBtn.last_active = true
        elseif(not currBtn.active and currBtn.last_active) then
            currBtn.last_active = false
        end
    end

end

function sync_switches(deviceData)

    --MCDU CAPT
    config_switches("MCDU_CAPT", deviceData)

    --MCDU FO
    --MCDU OBSERVER

end

----------------------- LCDs -----------------------

--Set brightness of LCD display. Input 0...1
function setDisplayBrightness(winwing_hid_dev)

    local newBrightVal = capt_brightness

    --Open connection to USB device
    --local winwing_hid_dev = hid_open(0x4098, winwing_device.product_id)

    hid_write(winwing_hid_dev, 0x02, 0x32, 0xbb, 0x00, 0x00, 0x03, 0x49, 0x01, round(0xff*newBrightVal), 0x00, 0x00, 0x00, 0x00, 0x00)

    --Close connection
    --hid_close(winwing_hid_dev)

end

--Set brightness of button backlight. Input 0...1
--todo can be done smarter, cf. fcu script
function setButtonBacklight(winwing_hid_dev)

    local newBrightVal = integ_light_brightness

    hid_write(winwing_hid_dev, 0x02, 0x32, 0xbb, 0x00, 0x00, 0x03, 0x49, 0x00, round(0xff*newBrightVal), 0x00, 0x00, 0x00, 0x00, 0x00)

end

colorMap = {}
colorMap[0] = 0 --black
colorMap[1] = 3 --cyan
colorMap[2] = 6 --red
colorMap[3] = 7 --yellow
colorMap[4] = 4 --green
colorMap[5] = 5 --magenta
colorMap[6] = 1 --amber
colorMap[7] = 2 --white

function prepareText(text_str)

    local output_array = {}

    --print("text_str = "..text_str)
    
    for i = 1, #text_str do

        local currChar = string.byte(text_str, i)
        
        --debug
        --if string.find(text_str, "ä") then
        --    print("a"..currChar.."b")
        --end

        --print("currChar = "..currChar)

        table.insert(output_array, currChar)

    end

    --print("output_array = ")
    --print(dump(output_array)) 

    return output_array

end

--Prepare style for one text char.
--Input is the raw style information as provided by the XP dataref,
--output the number as required by the Winwing hid write command.
--Source: https://developer.x-plane.com/article/datarefs-for-the-cdu-screen/, 2025-05-19
function prepareStyle(rawStyle)

    local style = 0

    --Handle the case that raw style is nil. This happens if the MCDU text does not show any
    --char at the current position. In this case, return style 0, i.e. text black and normal
    --font size, as the hid command expects data for "empty" chars
    if rawStyle == nil then
        return 0
    end

    --print("rawStyle = "..rawStyle)

    --If highest bit is zero, then use small font
    if not isBitSet(rawStyle, 0x80) then
        style = style + 0x16b
    end

    --Second highest bit is not evaluated, currently no use case known. 
    --Would mean black text and colored background

    --Third bit is not evaluated as well. Would mean flashing text.

    --Forth bit is not evaluated as well. Would mean underlining of the text. 

    --Least four bits define font color.
    --Not a very nice solution, but easy to implement. 
    local colorIndex = (isBitSet(rawStyle, 0x08) and 1 or 0)*0x08 + (isBitSet(rawStyle, 0x04) and 1 or 0)*0x04 + (isBitSet(rawStyle, 0x02) and 1 or 0)*0x02 + (isBitSet(rawStyle, 0x01) and 1 or 0)*0x01
    style = style + colorMap[colorIndex]*0x21

    return style

end

function prepareWriteCommands(mcdu_data)

    --print("prepareWriteCommands()...")

    --print("left arrow = "..dump(string_to_bytes("←")))
    --print("a = "..dump(string_to_bytes("a")))

    --Init
    local tmp_array = {}
    
    --Concatenate entire text field to one array
    for i = 1,#mcdu_data do

        --print(mcdu_text[i])
        --line = prepareText(mcdu_text[i])
        --print("line...")
        --print(dump(line))

        --Get current line
        currLine = mcdu_data[i]
        --print(dump(currLine))

        --print(dump(currLine))
        --print(dump(currLine[1]))

        --Go through all 24 chars of the current line
        for j=1,#currLine do

            local currDesign = split_number_into_bytes(prepareStyle(currLine[j].d), 2)

            --print(i.." - "..j.." - "..dump(currLine[j].t))

            table.insert(tmp_array, currDesign[1])
            table.insert(tmp_array, currDesign[2])
            table.insert(tmp_array, mcdu_data[i][j].t)

            
        end

    end

    --Flatten nested table (happens if multi-byte chars like the arrows are present)
    tmp_array = flatten(tmp_array)

    --print("tmp_array...")
    --print(dump(tmp_array))

    --print("Step 1 finished...")

    --Pad data for last command with 0x00 until desired length.
    --Actual length per command is 64, but the first byte is always 0xf2 and 
    --not contained in this array yet
    local currLength = #tmp_array
    if (currLength % 63 ~= 0) then
        for i = 1,(next_multiple(currLength,63) - currLength) do
            table.insert(tmp_array, 0x00)
        end
    end

   

    --Split into commands of length 64 bytes.
    --63 bytes of data plus leading 0xf2
    currLength = #tmp_array
    local output_array = {}
    --print("currLength = "..currLength)
    for i=0, currLength-1, 63 do  
        --print("i = "..i)
        local curr_command = {}
        table.insert(curr_command, 0xf2)
        for j=1+i,63+i do
            table.insert(curr_command, tmp_array[j])
        end
        --print("len curr command = "..#curr_command)
        table.insert(output_array, curr_command)
    end

    --logMsg("output_array = ")
    --print(dump(output_array[1]))

    return output_array

end

function initLcd()

     --Open connection to USB device
     local winwing_hid_dev = hid_open(0x4098, winwing_device.product_id)
    
     --Init LCD (set color etc.)
     --Color order: B G R
     color_0 = {0x00, 0x00, 0x00} -- style bytes +(0 * 0x21), default: 0xff, 0xff, 0xff = black
     color_1 = {} --style bytes +(1 * 0x21); ?? todo
     color_2 = {0xff, 0xff, 0xff} --style bytes +(2 * 0x21); default: 0xff, 0xff, 0xff = white
     color_3 = {0xff, 0xff, 0x0} --style bytes +(3 * 0x21); default: 0xff, 0xff, 0x0 = cyan
     color_4 = {0x3d, 0xff, 0x00} --style bytes +(4 * 0x21); default: 0x3d, 0xff, 0x0 = green
     color_5 = {0xff, 0x63, 0xff} --style bytes +(5 * 0x21); default: 0xff, 0x63, 0xff; todo maybe number wrong, maybe not set to default in SimAppPro
     color_6 = {0x0, 0x0, 0xff} --style bytes +(6 * 0x21); default: 0x0, 0x0, 0xff = red
     color_7 = {0x0, 0xff, 0xff} --style bytes +(7 * 0x21); 0x0, 0xff, 0xff = yellow
     color_8 = {0x42, 0x5c, 0x61} --style bytes +(8 * 0x21) = {0x08 0x01}; default: 0x42, 0x5c, 0x61 = yellowish gray
     color_9 = {0x77, 0x77, 0x77} --style bytes +(9 * 0x21) = {}; default: 0x77, 0x77, 0x77 = medium gray
     background_color = {0x00, 0x00, 0x00}
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x1, 0x38, 0x32, 0xbb, 0x0, 0x0, 0x1e, 0x1, 0x0, 0x0, 0xc4, 0x24, 0xa, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x18, 0x01, 0x0, 0x0, 0xc4, 0x24, 0xa, 0x0, 0x0, 0x8, 0x0, 0x0, 0x0, 0x34, 0x0, 0x18, 0x0, 0xe, 0x0, 0x18, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0xc4, 0x24, 0xa, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x2, 0x38, 0x0, 0x0, 0x0, 0x1, 0x0, 0x5, 0x0, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0xc4, 0x24, 0xa, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x1, 0x0, 0x6, 0x0, 0x0, 0x0, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x3, 0x38, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_0[1], color_0[2], color_0[3], 0xff, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, 0x0, 0xa5, 0xff, 0xff, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x4, 0x38, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_2[1],color_2[2], color_2[3], 0xff, 0x6, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_3[1], color_3[2], color_3[3], 0xff, 0x7, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x5, 0x38, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_4[1], color_4[2], color_4[3], 0xff, 0x8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, 0xff, 0x63, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x6, 0x38, 0xff, 0xff, 0x9, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_6[1], color_6[2], color_6[3], 0xff, 0xa, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x7, 0x38, 0x0, 0x0, 0x2, 0x0, color_7[1], color_7[2], color_7[3], 0xff, 0xb, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_8[1], color_8[2], color_8[3], 0xff, 0xc, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x8, 0x38, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, color_9[1], color_9[2], color_9[3], 0xff, 0xd, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x2, 0x0, 0x5e, 0x73, 0x79, 0xff, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x9, 0x38, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, background_color[1], background_color[2], background_color[3], 0x10, 0xf, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x0, 0xa5, 0xff, 0xff, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xa, 0x38, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0xff, 0xff, 0xff, 0xff, 0x11, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0xff, 0xff, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xb, 0x38, 0xff, 0x12, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x3d, 0xff, 0x0, 0xff, 0x13, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xc, 0x38, 0x0, 0x3, 0x0, color_5[1], color_5[2], color_5[3], 0xff, 0x14, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x0, 0x0, 0xff, 0xff, 0x15, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xd, 0x38, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x0, 0xff, 0xff, 0xff, 0x16, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x42, 0x5c, 0x61, 0xff, 0x17, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xe, 0x38, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x77, 0x77, 0x77, 0xff, 0x18, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x3, 0x0, 0x5e, 0x73, 0x79, 0xff, 0x19, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0xf, 0x38, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1a, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x4, 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x10, 0x38, 0x1b, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x19, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0xe, 0x0, 0x0, 0x0, 0x4, 0x0, 0x2, 0x0, 0x0, 0x0, 0x1c, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0xbb, 0x0, 0x0, 0x1a, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     hid_write(winwing_hid_dev, 0xf0, 0x0, 0x11, 0x12, 0x2, 0x32, 0xbb, 0x0, 0x0, 0x1c, 0x1, 0x0, 0x0, 0x76, 0x72, 0x19, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
     
     --Close connection
     hid_close(winwing_hid_dev)

end


--Powered by ChatCPT
--Splits string based on characters, not on bytes, 
--thus supports multi-byte chars like the arrows
function utf8_chars(str)
    local chars = {}
    local i = 1
    local len = #str
    while i <= len do
        local c = str:byte(i)
        local char_len = 1
        if c >= 0xF0 then
            char_len = 4
        elseif c >= 0xE0 then
            char_len = 3
        elseif c >= 0xC0 then
            char_len = 2
        end
        local char = str:sub(i, i + char_len - 1)
        table.insert(chars, char)
        i = i + char_len
    end
    return chars
end

function reformatText(raw_text, raw_design)

    local chars = utf8_chars(raw_text)

    --Avoid computationally expensive lists for code that is executed often
    local formatted_line = {}
    formatted_line[1] = {t = string_to_bytes(chars[1]), d = raw_design[1]}
    formatted_line[2] = {t = string_to_bytes(chars[2]), d = raw_design[2]}
    formatted_line[3] = {t = string_to_bytes(chars[3]), d = raw_design[3]}
    formatted_line[4] = {t = string_to_bytes(chars[4]), d = raw_design[4]}
    formatted_line[5] = {t = string_to_bytes(chars[5]), d = raw_design[5]}
    formatted_line[6] = {t = string_to_bytes(chars[6]), d = raw_design[6]}
    formatted_line[7] = {t = string_to_bytes(chars[7]), d = raw_design[7]}
    formatted_line[8] = {t = string_to_bytes(chars[8]), d = raw_design[8]}
    formatted_line[9] = {t = string_to_bytes(chars[9]), d = raw_design[9]}
    formatted_line[10] = {t = string_to_bytes(chars[10]), d = raw_design[10]}
    formatted_line[11] = {t = string_to_bytes(chars[11]), d = raw_design[11]}
    formatted_line[12] = {t = string_to_bytes(chars[12]), d = raw_design[12]}
    formatted_line[13] = {t = string_to_bytes(chars[13]), d = raw_design[13]}
    formatted_line[14] = {t = string_to_bytes(chars[14]), d = raw_design[14]}
    formatted_line[15] = {t = string_to_bytes(chars[15]), d = raw_design[15]}
    formatted_line[16] = {t = string_to_bytes(chars[16]), d = raw_design[16]}
    formatted_line[17] = {t = string_to_bytes(chars[17]), d = raw_design[17]}
    formatted_line[18] = {t = string_to_bytes(chars[18]), d = raw_design[18]}
    formatted_line[19] = {t = string_to_bytes(chars[19]), d = raw_design[19]}
    formatted_line[20] = {t = string_to_bytes(chars[20]), d = raw_design[20]}
    formatted_line[21] = {t = string_to_bytes(chars[21]), d = raw_design[21]}
    formatted_line[22] = {t = string_to_bytes(chars[22]), d = raw_design[22]}
    formatted_line[23] = {t = string_to_bytes(chars[23]), d = raw_design[23]}
    formatted_line[24] = {t = string_to_bytes(chars[24]), d = raw_design[24]}

    return formatted_line

end

--Concatenate style information from the datarefs for each line into
--one table. 
function concatStyle(style0, style1, style2, style3, style4, style5, style6, style7, style8, style9, style10, style11, style12, style13, style14, style15, style16, style17, style18, style19, style20, style21, style22, style23)

    local style = {
        string.byte(style0),string.byte(style1),string.byte(style2),string.byte(style3),string.byte(style4),
        string.byte(style5),string.byte(style6),string.byte(style7),string.byte(style8),string.byte(style9),
        string.byte(style10),string.byte(style11),string.byte(style12),string.byte(style13),string.byte(style14),
        string.byte(style15),string.byte(style16),string.byte(style17),string.byte(style18),string.byte(style19),
        string.byte(style20),string.byte(style21),string.byte(style22),string.byte(style23)
    }

    return style

end

function syncCaptLcd(winwining_hid_device)

    --print("syncCaptLcd()...")

    --debug
    --print("capt_text4 = ")
    --print(capt_text4)
    --raw_design = {0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0x02901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    --print(dump(reformatText(capt_text4, raw_design)))

    --print("capt_style1 = a"..capt_style1.."b")
    --print(string.byte(capt_style1,1,24))
    --print(string.byte(capt_style2))

    --Get MCDU text and style from the datarefs, reformat it so that it can be processed easily
    local mcdu_data = {
        reformatText(capt_text0, concatStyle(capt_style0_0, capt_style0_1, capt_style0_2, capt_style0_3, capt_style0_4, capt_style0_5, capt_style0_6, capt_style0_7, capt_style0_8, capt_style0_9, capt_style0_10, capt_style0_11, capt_style0_12, capt_style0_13, capt_style0_14, capt_style0_15, capt_style0_16, capt_style0_17, capt_style0_18, capt_style0_19, capt_style0_20, capt_style0_21, capt_style0_22, capt_style0_23)),
        reformatText(capt_text1, concatStyle(capt_style1_0, capt_style1_1, capt_style1_2, capt_style1_3, capt_style1_4, capt_style1_5, capt_style1_6, capt_style1_7, capt_style1_8, capt_style1_9, capt_style1_10, capt_style1_11, capt_style1_12, capt_style1_13, capt_style1_14, capt_style1_15, capt_style1_16, capt_style1_17, capt_style1_18, capt_style1_19, capt_style1_20, capt_style1_21, capt_style1_22, capt_style1_23)),
        reformatText(capt_text2, concatStyle(capt_style2_0, capt_style2_1, capt_style2_2, capt_style2_3, capt_style2_4, capt_style2_5, capt_style2_6, capt_style2_7, capt_style2_8, capt_style2_9, capt_style2_10, capt_style2_11, capt_style2_12, capt_style2_13, capt_style2_14, capt_style2_15, capt_style2_16, capt_style2_17, capt_style2_18, capt_style2_19, capt_style2_20, capt_style2_21, capt_style2_22, capt_style2_23)),
        reformatText(capt_text3, concatStyle(capt_style3_0, capt_style3_1, capt_style3_2, capt_style3_3, capt_style3_4, capt_style3_5, capt_style3_6, capt_style3_7, capt_style3_8, capt_style3_9, capt_style3_10, capt_style3_11, capt_style3_12, capt_style3_13, capt_style3_14, capt_style3_15, capt_style3_16, capt_style3_17, capt_style3_18, capt_style3_19, capt_style3_20, capt_style3_21, capt_style3_22, capt_style3_23)),
        reformatText(capt_text4, concatStyle(capt_style4_0, capt_style4_1, capt_style4_2, capt_style4_3, capt_style4_4, capt_style4_5, capt_style4_6, capt_style4_7, capt_style4_8, capt_style4_9, capt_style4_10, capt_style4_11, capt_style4_12, capt_style4_13, capt_style4_14, capt_style4_15, capt_style4_16, capt_style4_17, capt_style4_18, capt_style4_19, capt_style4_20, capt_style4_21, capt_style4_22, capt_style4_23)),
        reformatText(capt_text5, concatStyle(capt_style5_0, capt_style5_1, capt_style5_2, capt_style5_3, capt_style5_4, capt_style5_5, capt_style5_6, capt_style5_7, capt_style5_8, capt_style5_9, capt_style5_10, capt_style5_11, capt_style5_12, capt_style5_13, capt_style5_14, capt_style5_15, capt_style5_16, capt_style5_17, capt_style5_18, capt_style5_19, capt_style5_20, capt_style5_21, capt_style5_22, capt_style5_23)),
        reformatText(capt_text6, concatStyle(capt_style6_0, capt_style6_1, capt_style6_2, capt_style6_3, capt_style6_4, capt_style6_5, capt_style6_6, capt_style6_7, capt_style6_8, capt_style6_9, capt_style6_10, capt_style6_11, capt_style6_12, capt_style6_13, capt_style6_14, capt_style6_15, capt_style6_16, capt_style6_17, capt_style6_18, capt_style6_19, capt_style6_20, capt_style6_21, capt_style6_22, capt_style6_23)),
        reformatText(capt_text7, concatStyle(capt_style7_0, capt_style7_1, capt_style7_2, capt_style7_3, capt_style7_4, capt_style7_5, capt_style7_6, capt_style7_7, capt_style7_8, capt_style7_9, capt_style7_10, capt_style7_11, capt_style7_12, capt_style7_13, capt_style7_14, capt_style7_15, capt_style7_16, capt_style7_17, capt_style7_18, capt_style7_19, capt_style7_20, capt_style7_21, capt_style7_22, capt_style7_23)),
        reformatText(capt_text8, concatStyle(capt_style8_0, capt_style8_1, capt_style8_2, capt_style8_3, capt_style8_4, capt_style8_5, capt_style8_6, capt_style8_7, capt_style8_8, capt_style8_9, capt_style8_10, capt_style8_11, capt_style8_12, capt_style8_13, capt_style8_14, capt_style8_15, capt_style8_16, capt_style8_17, capt_style8_18, capt_style8_19, capt_style8_20, capt_style8_21, capt_style8_22, capt_style8_23)),
        reformatText(capt_text9, concatStyle(capt_style9_0, capt_style9_1, capt_style9_2, capt_style9_3, capt_style9_4, capt_style9_5, capt_style9_6, capt_style9_7, capt_style9_8, capt_style9_9, capt_style9_10, capt_style9_11, capt_style9_12, capt_style9_13, capt_style9_14, capt_style9_15, capt_style9_16, capt_style9_17, capt_style9_18, capt_style9_19, capt_style9_20, capt_style9_21, capt_style9_22, capt_style9_23)),
        reformatText(capt_text10, concatStyle(capt_style10_0, capt_style10_1, capt_style10_2, capt_style10_3, capt_style10_4, capt_style10_5, capt_style10_6, capt_style10_7, capt_style10_8, capt_style10_9, capt_style10_10, capt_style10_11, capt_style10_12, capt_style10_13, capt_style10_14, capt_style10_15, capt_style10_16, capt_style10_17, capt_style10_18, capt_style10_19, capt_style10_20, capt_style10_21, capt_style10_22, capt_style10_23)),
        reformatText(capt_text11, concatStyle(capt_style11_0, capt_style11_1, capt_style11_2, capt_style11_3, capt_style11_4, capt_style11_5, capt_style11_6, capt_style11_7, capt_style11_8, capt_style11_9, capt_style11_10, capt_style11_11, capt_style11_12, capt_style11_13, capt_style11_14, capt_style11_15, capt_style11_16, capt_style11_17, capt_style11_18, capt_style11_19, capt_style11_20, capt_style11_21, capt_style11_22, capt_style11_23)),
        reformatText(capt_text12, concatStyle(capt_style12_0, capt_style12_1, capt_style12_2, capt_style12_3, capt_style12_4, capt_style12_5, capt_style12_6, capt_style12_7, capt_style12_8, capt_style12_9, capt_style12_10, capt_style12_11, capt_style12_12, capt_style12_13, capt_style12_14, capt_style12_15, capt_style12_16, capt_style12_17, capt_style12_18, capt_style12_19, capt_style12_20, capt_style12_21, capt_style12_22, capt_style12_23)),
        reformatText(capt_text13, concatStyle(capt_style13_0, capt_style13_1, capt_style13_2, capt_style13_3, capt_style13_4, capt_style13_5, capt_style13_6, capt_style13_7, capt_style13_8, capt_style13_9, capt_style13_10, capt_style13_11, capt_style13_12, capt_style13_13, capt_style13_14, capt_style13_15, capt_style13_16, capt_style13_17, capt_style13_18, capt_style13_19, capt_style13_20, capt_style13_21, capt_style13_22, capt_style13_23))
    }
        
    --Prepare write commands
    mcdu_commands = prepareWriteCommands(mcdu_data)

    --print("mcdu_commands = ")
    --print(dump(mcdu_commands))
    --print(dump(mcdu_commands[1]))

    --Send commands to device
    for i=1,#mcdu_commands do
        --print(dump(mcdu_commands[i]))
        hid_write(winwining_hid_device,
        mcdu_commands[i][1], mcdu_commands[i][2], mcdu_commands[i][3], mcdu_commands[i][4], mcdu_commands[i][5], mcdu_commands[i][6], mcdu_commands[i][7], mcdu_commands[i][8], mcdu_commands[i][9], mcdu_commands[i][10],
        mcdu_commands[i][11], mcdu_commands[i][12], mcdu_commands[i][13], mcdu_commands[i][14], mcdu_commands[i][15], mcdu_commands[i][16], mcdu_commands[i][17], mcdu_commands[i][18], mcdu_commands[i][19], mcdu_commands[i][20],
        mcdu_commands[i][21], mcdu_commands[i][22], mcdu_commands[i][23], mcdu_commands[i][24], mcdu_commands[i][25], mcdu_commands[i][26], mcdu_commands[i][27], mcdu_commands[i][28], mcdu_commands[i][29], mcdu_commands[i][30],
        mcdu_commands[i][31], mcdu_commands[i][32], mcdu_commands[i][33], mcdu_commands[i][34], mcdu_commands[i][35], mcdu_commands[i][36], mcdu_commands[i][37], mcdu_commands[i][38], mcdu_commands[i][39], mcdu_commands[i][40],
        mcdu_commands[i][41], mcdu_commands[i][42], mcdu_commands[i][43], mcdu_commands[i][44], mcdu_commands[i][45], mcdu_commands[i][46], mcdu_commands[i][47], mcdu_commands[i][48], mcdu_commands[i][49], mcdu_commands[i][50],
        mcdu_commands[i][51], mcdu_commands[i][52], mcdu_commands[i][53], mcdu_commands[i][54], mcdu_commands[i][55], mcdu_commands[i][56], mcdu_commands[i][57], mcdu_commands[i][58], mcdu_commands[i][59], mcdu_commands[i][60],
        mcdu_commands[i][61], mcdu_commands[i][62], mcdu_commands[i][63], mcdu_commands[i][64])
    
    end

    --Write data to LCD
    --config_lcd(winwining_hid_device, winwing_device["CAPT"].lcd_flags, winwing_device["CAPT"].lcd_data, "CAPT")

end

----------------------- Init -----------------------

winwing_device = {}

function init_winwing_device()

    logMsg("Running init_winwing_device()...")

    local bit = require("bit")
    local socket = require("socket")

    --product id when set to MCDU-32-CO-PILOT 0xbb3e
    --product id when set to MCDU-32-OBSERVER 0xbb3a
    --product id when set to MCDU-32-CAPTAIN 0xbb36
    for i = 1,NUMBER_OF_HID_DEVICES do
        local device = ALL_HID_DEVICES[i]
        --debug print("device id = "..device.product_id)
        if ((device.vendor_id == 0x4098) and (device.product_id == 0xbb36) ) then
            winwing_device["MCDU_CAPT"] =     {buttons = btn_cpt,   leds = led_list_cpt,      lcd_data = lcd_data_cpt,    lcd_flags = lcd_flags_cpt   }
            logMsg("MCDU CAPT found")
        end
        if ((device.vendor_id == 0x4098) and (device.product_id == 0xbb3e) ) then
            winwing_device["MCDU_FO"] =   {buttons = btn_fo,     leds = led_list_fo,   lcd_data = lcd_data_fo,  lcd_flags = lcd_flags_fo }
            logMsg("MCDU FO found")
            logMgs("Attention: MCDU FO not supported yet...")
        end
        if ((device.vendor_id == 0x4098) and (device.product_id == 0xbb3a) ) then
            winwing_device["MCDU_OBSERVER"] =   {buttons = btn_obs,     leds = led_list_obs,   lcd_data = lcd_data_obs,  lcd_flags = lcd_flags_obs }
            logMsg("MCDU OBSERVER found")
            logMgs("Attention: MCDU OBSERVER not supported yet...")
        end 

        --todo add description
        if (not isEmpty(winwing_device)) then 
            logMsg("found device")
            winwing_device["product_id"] = device.product_id
            updateCaptTextCache()
            updateGeneralCache()
            initLcd()
            break
        end

    end

    --stop executing the script if no MCDU is found or
    --start refresh function
    if (winwing_device == nil) then
        logMsg("No Winwing MCDU found at all, can't continue.")
        return
    else
        do_every_frame("syncDeviceAndSim()")
    end

end

----------------------- Utils -----------------------

--Powered by ChatGPT
function next_multiple(x, n)
    return math.floor((x + n - 1) / n) * n
end

--Powered by ChatGPT
--Split a integer into individual bytes, e.g. decimal 264 = 0x01 0x08
function split_number_into_bytes(num, byte_count)
    local bytes = {}
    for i = 1, byte_count do
        local byte = num % 256
        table.insert(bytes, byte)
        num = math.floor(num / 256)
    end
    return bytes
end

--Powered by ChatGPT
--Convert string to bytes; used to convert one char into one or multiple
--bytes
function string_to_bytes(str)
    local bytes = {string.byte(str, 1, #str)}
    return bytes
end

--Powered by ChatGPT
--Flatten nested table
function flatten(t, result)
    result = result or {}
    for _, v in ipairs(t) do
        if type(v) == "table" then
            flatten(v, result)  -- recurse into subtable
        else
            table.insert(result, v)
        end
    end
    return result
end

function isEmpty(tbl)

    return (next(tbl) == nil)

end

--determines whether in a given byte a certain bit is set.
--both the byte and the "bit" have to be specified as byte,
--i.e. the third bit (from right to left) means bitValue = 0x08,
--the first bit means bitValue = 0x01, etc.
function isBitSet(byteValue, bitValue)

    return (bit.band(byteValue,bitValue) > 0)

end

function round(x)
    return math.floor(x+0.5)
end

--Source: https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console, 2025-04-27
function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

--todo check why reading data sometimes fails due to invalid length if it is done inside of this function
--Remark: Reading data failes (i.e. data_in has wrong length) only in very rare cases, probably nothing
--        to worry about
function readDataFromDevice(winwing_hid_dev)

    local data_in = {hid_read(winwing_hid_dev,26)}

    if(data_in[1] == nil) then
        logMsg("readDataFromDevice(): Can't read from device")
        return
    end

    local n = data_in[1] -- index start from 1.....
    if (n == nil or n ~= 25) then
        logMsg("readDataFromDevice(): invalid input data length... "..n)
        return
    end

    return data_in

end

----------------------- Update -----------------------

function updateGeneralCache()

    local numChanges = 0

    if (cache_data["capt_brightness"] ~= capt_brightness) then cache_data["capt_brightness"] = capt_brightness numChanges = numChanges + 1 end
    if (cache_data["integ_light_brightness"] ~= integ_light_brightness) then cache_data["integ_light_brightness"] = integ_light_brightness numChanges = numChanges + 1 end
    
    return (numChanges > 0)

end

function updateCaptTextCache()

    local numChanges = 0

    if (cache_data["capt_text0"] ~= capt_text0) then cache_data["capt_text0"] = capt_text0 numChanges = numChanges + 1 end
    if (cache_data["capt_text1"] ~= capt_text1) then cache_data["capt_text1"] = capt_text1 numChanges = numChanges + 1 end
    if (cache_data["capt_text2"] ~= capt_text2) then cache_data["capt_text2"] = capt_text2 numChanges = numChanges + 1 end
    if (cache_data["capt_text3"] ~= capt_text3) then cache_data["capt_text3"] = capt_text3 numChanges = numChanges + 1 end
    if (cache_data["capt_text4"] ~= capt_text4) then cache_data["capt_text4"] = capt_text4 numChanges = numChanges + 1 end
    if (cache_data["capt_text5"] ~= capt_text5) then cache_data["capt_text5"] = capt_text5 numChanges = numChanges + 1 end
    if (cache_data["capt_text6"] ~= capt_text6) then cache_data["capt_text6"] = capt_text6 numChanges = numChanges + 1 end
    if (cache_data["capt_text7"] ~= capt_text7) then cache_data["capt_text7"] = capt_text7 numChanges = numChanges + 1 end
    if (cache_data["capt_text8"] ~= capt_text8) then cache_data["capt_text8"] = capt_text8 numChanges = numChanges + 1 end
    if (cache_data["capt_text9"] ~= capt_text9) then cache_data["capt_text9"] = capt_text9 numChanges = numChanges + 1 end
    if (cache_data["capt_text10"] ~= capt_text10) then cache_data["capt_text10"] = capt_text10 numChanges = numChanges + 1 end
    if (cache_data["capt_text11"] ~= capt_text11) then cache_data["capt_text11"] = capt_text11 numChanges = numChanges + 1 end
    if (cache_data["capt_text12"] ~= capt_text12) then cache_data["capt_text12"] = capt_text12 numChanges = numChanges + 1 end
    if (cache_data["capt_text13"] ~= capt_text13) then cache_data["capt_text13"] = capt_text13 numChanges = numChanges + 1 end

    return (numChanges > 0)

end

function syncDeviceAndSim()

    --Open connection to USB device
    local winwing_hid_dev = hid_open(0x4098, winwing_device.product_id)

    --Read data from USB device
    local currentDeviceData = readDataFromDevice(winwing_hid_dev)

    --Sync positions of switches/buttons/knobs from Winwing MCDU to XP12.
    --Do this only if the data read from the devices is correct; for an unknown reason
    --it failes for a frame occasionally
    if(currentDeviceData ~= nil and currentDeviceData[1] == 25) then
        sync_switches(currentDeviceData)
    end
--
    ----Sync MCDU text from XP12 to Winwing MCDU CAPT
    if(updateCaptTextCache()) then

        --logMsg("Updating MCDU CAPT...")

        

        --syncFcuAnnunLeds(winwing_hid_dev)
        syncCaptLcd(winwing_hid_dev)
    end

    --Sync other elements, e.g. annuncator LEDs, display brightness
    if(updateGeneralCache()) then

        --print("capt_brightness = "..capt_brightness)

        setDisplayBrightness(winwing_hid_dev)
        setButtonBacklight(winwing_hid_dev)

    end

    --Close connection
    hid_close(winwing_hid_dev)
   
   
end

----------------------- Main -----------------------

init_winwing_device()

