perf stat -e \
cycle_activity.stalls_l3_miss,\
cycle_activity.stalls_l1d_miss,\
cycle_activity.stalls_l2_miss,\
cycle_activity.stalls_mem_any,\
cycle_activity.stalls_total,\
ild_stall.lcp,\
partial_rat_stalls.scoreboard,\
resource_stalls.any,\
resource_stalls.sb,\
uops_executed.stall_cycles,\
uops_issued.stall_cycles,\
uops_retired.stall_cycles,\
cycles $1