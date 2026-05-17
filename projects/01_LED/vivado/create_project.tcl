# Create project
create_project led_control ./build -force

# IMPORTANT: absolute board store path (FIXED)
set board_store "/home/rens-jan/.Xilinx/Vivado/2025.2/xhub/board_store/xilinx_board_store"

# Register board repository properly
set_param board.repoPaths [list $board_store]

# (optional but helpful) also set project property
set_property board_part_repo_paths $board_store [current_project]

# Set board explicitly
set_property board_part "tul.com.tw:pynq-z2:part0:1.0" [current_project]