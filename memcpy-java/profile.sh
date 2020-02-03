perf stat -e \
L1-dcache-loads,L1-dcache-load-misses,L1-dcache-stores,\
l1d.replacement,l1d_pend_miss.fb_full,l1d_pend_miss.pending,\
LLC-loads,LLC-load-misses,LLC-stores,l2_rqsts.all_pf,\
sw_prefetch_access.t1_t2,l2_lines_out.useless_hwpf,l2_rqsts.pf_hit,\
l2_rqsts.pf_miss,load_hit_pre.sw_pf,l2_rqsts.rfo_hit,l2_rqsts.rfo_miss,l2_rqsts.all_rfo,\
offcore_requests.all_data_rd,offcore_requests.all_requests,\
offcore_response.demand_data_rd.any_response,\
bus-cycles,\
resource_stalls.any,resource_stalls.sb,\
uops_retired.stall_cycles,uops_executed.stall_cycles,uops_issued.stall_cycles,\
cycle_activity.stalls_l1d_miss,cycle_activity.stalls_l2_miss,cycle_activity.stalls_l3_miss,\
cycle_activity.stalls_mem_any,cycle_activity.stalls_total,\
ld_blocks_partial.address_alias,ld_blocks.store_forward,\
cycles $1
