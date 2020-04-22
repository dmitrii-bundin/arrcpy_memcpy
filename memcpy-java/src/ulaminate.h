#ifndef UNLAMINATE_H
#define UNLAMINATE_H

void test_tag_hit(size_t iteration_count);

void test_bubble_slots(size_t iteration_count);

void unl_store_op_base_idx_disp(void *dest, size_t value, size_t idx, size_t iteration_count);

void unl_store_op_base_idx_disp2(void *dest, size_t value, size_t idx, size_t iteration_count);

void unl_store_op_base_disp(void *dest, size_t value, size_t iteration_count);

#endif //UNLAMINATE_H