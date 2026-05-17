########################################
# PROJECT ROOT CONTEXT
########################################
set script_dir [file normalize [file dirname [info script]]]

########################################
# STEP 1: CREATE PROJECT
########################################
puts "==> Creating project..."
source $script_dir/create_project.tcl

########################################
# STEP 2: ADD SOURCES + CONSTRAINTS
########################################
puts "==> Adding sources..."
source $script_dir/add_sources.tcl

########################################
# STEP 3: CREATE BLOCK DESIGN
########################################
puts "==> Building block design..."
source $script_dir/block_design.tcl

########################################
# STEP 4: FINALIZE BD
########################################
puts "==> Finalizing block design..."

validate_bd_design
save_bd_design

# Create wrapper and capture the returned file
set wrapper [make_wrapper -files [get_files design_1.bd] -top]

# Add wrapper directly (no searching/filtering)
add_files -norecurse $wrapper

# Set top module
set_property top design_1_wrapper [current_fileset]

update_compile_order -fileset sources_1

########################################
# DONE
########################################
puts "==================================="
puts "PROJECT SETUP COMPLETE ✔"
puts "You can now open Vivado GUI or run synthesis manually."
puts "==================================="