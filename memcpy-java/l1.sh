perf stat -e \
L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores,l1d.replacement,\
l1d_pend_miss.fb_full,l1d_pend_miss.pending,l1d_pend_miss.pending_cycles,\
l1d_pend_miss.pending_cycles_any,\
cycles $1