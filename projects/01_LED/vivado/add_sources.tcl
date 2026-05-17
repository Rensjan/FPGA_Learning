########################################
# RTL FILES (.v)
########################################
if {[file exists ./rtl]} {
    set v_files [glob -nocomplain ./rtl/*.v]
    if {[llength $v_files] > 0} {
        add_files $v_files
        puts "Added Verilog files: $v_files"
    } else {
        puts "No Verilog files found"
    }
}

########################################
# SYSTEMVERILOG FILES (.sv)
########################################
if {[file exists ./rtl]} {
    set sv_files [glob -nocomplain ./rtl/*.sv]
    if {[llength $sv_files] > 0} {
        add_files $sv_files
        puts "Added SystemVerilog files: $sv_files"
    } else {
        puts "No SystemVerilog files found"
    }
}

########################################
# CONSTRAINTS (.xdc)
########################################
if {[file exists ./constraints]} {
    set xdc_files [glob -nocomplain ./constraints/*.xdc]
    if {[llength $xdc_files] > 0} {
        add_files -fileset constrs_1 $xdc_files
        puts "Added constraints: $xdc_files"
    } else {
        puts "No XDC files found"
    }
}

########################################
# SAFE COMPILE ORDER UPDATE
########################################
update_compile_order -fileset sources_1