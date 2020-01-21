perf stat -e \
L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,\
LLC-loads,LLC-load-misses,LLC-stores,l2_rqsts.all_pf,\
sw_prefetch_access.t1_t2,l2_lines_out.useless_hwpf,l2_rqsts.pf_hit,\
l2_rqsts.pf_miss,load_hit_pre.sw_pf,l2_rqsts.rfo_hit,l2_rqsts.rfo_miss,l2_rqsts.all_rfo,\
resource_stalls.any,resource_stalls.sb,uops_executed.stall_cycles,uops_issued.stall_cycles,\
offcore_requests.all_data_rd,offcore_requests.all_requests,\
offcore_response.demand_data_rd.any_response,\
bus-cycles,\
uops_retired.stall_cycles,uops_retired.total_cycles,cycles $1
