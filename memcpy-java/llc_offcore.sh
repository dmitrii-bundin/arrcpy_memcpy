perf stat -e \
offcore_response.demand_data_rd.any_response,\
offcore_response.demand_rfo.any_response,\
offcore_response.other.any_response,\
offcore_requests.all_data_rd,\
offcore_requests.all_requests,\
offcore_requests.demand_data_rd,\
offcore_requests.demand_rfo,\
offcore_requests_buffer.sq_full,\
offcore_requests_outstanding.all_data_rd,\
offcore_requests_outstanding.cycles_with_data_rd,\
offcore_requests_outstanding.cycles_with_demand_data_rd,\
offcore_requests_outstanding.cycles_with_demand_rfo,\
offcore_requests_outstanding.demand_data_rd,\
offcore_requests_outstanding.demand_data_rd_ge_6,\
offcore_requests_outstanding.demand_rfo,\
offcore_response,\
cycles $1