perf stat -e \
frontend_retired.dsb_miss,\
frontend_retired.itlb_miss,\
frontend_retired.l1i_miss,\
frontend_retired.l2_miss,\
frontend_retired.latency_ge_128,\
frontend_retired.latency_ge_16,\
frontend_retired.latency_ge_2,\
frontend_retired.latency_ge_256,\
frontend_retired.latency_ge_2_bubbles_ge_1,\
frontend_retired.latency_ge_2_bubbles_ge_2,\
frontend_retired.latency_ge_2_bubbles_ge_3,\
frontend_retired.latency_ge_32,\
frontend_retired.latency_ge_4,\
frontend_retired.latency_ge_512,\
frontend_retired.latency_ge_64,\
frontend_retired.latency_ge_8,\
frontend_retired.stlb_miss,\
cycles $1