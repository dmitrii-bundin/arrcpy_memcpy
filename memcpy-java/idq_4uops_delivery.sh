perf stat -e \
idq.all_dsb_cycles_4_uops,\
idq.all_dsb_cycles_any_uops,\
idq.dsb_uops,\
idq.dsb_cycles,\
idq_uops_not_delivered.core,\
idq_uops_not_delivered.cycles_0_uops_deliv.core,\
idq_uops_not_delivered.cycles_le_1_uop_deliv.core,\
idq_uops_not_delivered.cycles_le_2_uop_deliv.core,\
idq_uops_not_delivered.cycles_le_3_uop_deliv.core,\
idq_uops_not_delivered.cycles_fe_was_ok,\
frontend_retired.latency_ge_2_bubbles_ge_1,\
frontend_retired.latency_ge_2_bubbles_ge_2,\
frontend_retired.latency_ge_2_bubbles_ge_3,\
frontend_retired.latency_ge_2,\
frontend_retired.latency_ge_4,\
frontend_retired.latency_ge_8,\
frontend_retired.latency_ge_16,\
frontend_retired.latency_ge_32,\
frontend_retired.latency_ge_64,\
frontend_retired.latency_ge_128,\
frontend_retired.latency_ge_256,\
uops_issued.any,\
uops_retired.total_cycles,\
uops_retired.retire_slots,\
cycles $1