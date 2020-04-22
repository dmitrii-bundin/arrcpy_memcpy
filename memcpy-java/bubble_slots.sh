perf stat -e \
idq.dsb_uops,\
idq.mite_uops,\
idq.ms_uops,\
frontend_retired.latency_ge_2_bubbles_ge_1,\
frontend_retired.latency_ge_2_bubbles_ge_2,\
frontend_retired.latency_ge_2_bubbles_ge_3,\
idq_uops_not_delivered.core,\
idq_uops_not_delivered.cycles_0_uops_deliv.core,\
idq_uops_not_delivered.cycles_le_1_uop_deliv.core,\
idq_uops_not_delivered.cycles_le_2_uop_deliv.core,\
idq_uops_not_delivered.cycles_le_3_uop_deliv.core,\
idq_uops_not_delivered.cycles_fe_was_ok,\
dsb2mite_switches.penalty_cycles,\
frontend_retired.dsb_miss,\
cycles $1