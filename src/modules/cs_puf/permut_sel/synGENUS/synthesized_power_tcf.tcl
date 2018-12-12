#-----------------------------------------------------------------------------------------------------------
#------------------------------------- GENUS power estimation file -------------------------------------------
#-----------------------------------------------------------------------------------------------------------
source ./SAVED_STATE/raifes_core.genus_setup.tcl

read_tcf ./SA_Synthesized.tcf

set_analysis_view -setup slow_ss -hold slow_ss
report_power -depth 2 > ./results/raifes_core.power_slow_tcf

set_analysis_view -setup fast_ff -hold fast_ff
report_power -depth 2 > ./results/raifes_core.power_fast_tcf

set_analysis_view -setup typical -hold typical
report_power -depth 2 > ./results/raifes_core.power_typ_tcf

exit