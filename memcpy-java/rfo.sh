perf stat -e \
L1-dcache-load-misses,\
L1-dcache-loads,\
L1-dcache-stores,\
l2_rqsts.all_rfo,\
l2_rqsts.rfo_hit,\
l2_rqsts.rfo_miss,\
l2_rqsts.all_pf,\
l2_rqsts.pf_hit,\
l2_rqsts.pf_miss,\
offcore_requests.demand_rfo,\
offcore_response.demand_rfo.any_response,\
dTLB-load-misses,\
dTLB-loads,\
dTLB-store-misses,\
dTLB-stores,\
offcore_requests.all_data_rd,\
cycles $1
