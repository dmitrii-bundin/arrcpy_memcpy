perf stat -e \
l2_lines_in.all,l2_lines_out.non_silent,l2_lines_out.silent,l2_lines_out.useless_hwpf,\
l2_rqsts.all_demand_data_rd,l2_rqsts.all_demand_miss,l2_rqsts.all_demand_references,\
l2_rqsts.all_pf,l2_rqsts.all_rfo,l2_rqsts.demand_data_rd_hit,l2_rqsts.demand_data_rd_miss,\
l2_rqsts.miss,l2_rqsts.pf_hit,l2_rqsts.pf_miss,l2_rqsts.references,l2_rqsts.rfo_hit,l2_rqsts.rfo_miss,\
l2_trans.l2_wb,\
cycles $1