########################################
# RTL FILES (.v)
########################################
if {[file exists ../rtl]} {
    set v_files [glob -nocomplain ../rtl/*.v]
    if {[llength $v_files] > 0} {
        add_files $v_files
        puts "Added Verilog RTL files: $v_files"
    } else {
        puts "No Verilog RTL files found"
    }
}

########################################
# SYSTEMVERILOG RTL FILES (.sv)
########################################
if {[file exists ../rtl]} {
    set sv_files [glob -nocomplain ../rtl/*.sv]
    if {[llength $sv_files] > 0} {
        add_files $sv_files
        puts "Added SystemVerilog RTL files: $sv_files"
    } else {
        puts "No SystemVerilog RTL files found"
    }
}

########################################
# TESTBENCH FILES (.v)
########################################
if {[file exists ../sim]} {
    set tb_v_files [glob -nocomplain ../sim/*.v]
    if {[llength $tb_v_files] > 0} {
        add_files -fileset sim_1 $tb_v_files
        puts "Added Verilog testbench files: $tb_v_files"
    } else {
        puts "No Verilog testbench files found"
    }
}

########################################
# TESTBENCH SYSTEMVERILOG FILES (.sv)
########################################
if {[file exists ../sim]} {
    set tb_sv_files [glob -nocomplain ../sim/*.sv]
    if {[llength $tb_sv_files] > 0} {
        add_files -fileset sim_1 $tb_sv_files
        puts "Added SystemVerilog testbench files: $tb_sv_files"
    } else {
        puts "No SystemVerilog testbench files found"
    }
}

########################################
# CONSTRAINTS (.xdc)
########################################
if {[file exists ../constraints]} {
    set xdc_files [glob -nocomplain ../constraints/*.xdc]
    if {[llength $xdc_files] > 0} {
        add_files -fileset constrs_1 $xdc_files
        puts "Added constraints: $xdc_files"
    } else {
        puts "No XDC files found"
    }
}

########################################
# COMPILE ORDER
########################################
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

########################################
# SET TOP MODULES
########################################

# RTL tops
set_property top adder [get_filesets sources_1]

# SIM top
set_property top tb_adder [get_filesets sim_1]