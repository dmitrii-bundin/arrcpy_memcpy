perf stat -e \
uops_dispatched_port.port_0,\
uops_dispatched_port.port_1,\
uops_dispatched_port.port_2,\
uops_dispatched_port.port_3,\
uops_dispatched_port.port_4,\
uops_dispatched_port.port_5,\
uops_dispatched_port.port_6,\
uops_dispatched_port.port_7,\
uops_executed.thread,\
uops_executed.core,\
resource_stalls.any,\
uops_issued.any,\
uops_issued.stall_cycles,\
uops_retired.stall_cycles,\
uops_retired.total_cycles,\
uops_retired.retire_slots,\
lsd.uops,\
cpu_clk_unhalted.thread,\
idq_uops_not_delivered.core,\
int_misc.recovery_cycles,\
cycles $1