tclmode

# Generated by Genus(TM) Synthesis Solution 17.22-s017_1, revision 1.272a
# Generated on: Mon Nov 19 14:06:54 CET 2018 (Mon Nov 19 13:06:54 GMT 2018)

set lec_version [regsub {(-).} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file fv/permut_sel_aio/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/permut_sel_aio -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license

set env(RC_VERSION)     "17.22-s017_1"
set env(CDN_SYNTH_ROOT) "/sw/lx_sw/lxcad/genus17.22.000/tools"
set CDN_SYNTH_ROOT      "/sw/lx_sw/lxcad/genus17.22.000/tools"
set env(CW_DIR) "/sw/lx_sw/lxcad/genus17.22.000/tools/lib/chipware"
set CW_DIR      "/sw/lx_sw/lxcad/genus17.22.000/tools/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path . /sw/lx_sw/lxcad/genus17.22.000/tools/lib/tech -library -both
read_library -liberty -both   /sw/ims_db/lib/L035/l035v0v6dc/.lib/synthesis/L035dc.lib

set_undriven_signal Z -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

delete_search_path -all -design -golden
add_search_path /Abteilungen/ISS/ISS-ALL/unix/cad/RISCV/local/riscv-flavor/trunk/flavor/src/modules/cs_puf/permut_sel/src -design -golden
read_design   -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -verilog2k /Abteilungen/ISS/ISS-ALL/unix/cad/RISCV/local/riscv-flavor/trunk/flavor/src/modules/cs_puf/permut_sel/src/permut_sel.v
elaborate_design -golden -root {permut_sel_aio} -rootonly 

read_design -verilog95   -revised -lastmod -noelab fv/permut_sel_aio/fv_map.v.gz
elaborate_design -revised -root {permut_sel_aio}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

#add_name_alias fv/permut_sel_aio/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both

set_analyze_option -auto

write_hier_compare_dofile hier_tmp1.lec.do -noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence -prepend_string " analyze_datapath -module -verbose ; analyze_datapath -share  -verbose; "
run_hier_compare hier_tmp1.lec.do -dynamic_hierarchy

report_verification -hier -verbose
set_system_mode lec
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}

write_verification_information
report_verification_information

exit

