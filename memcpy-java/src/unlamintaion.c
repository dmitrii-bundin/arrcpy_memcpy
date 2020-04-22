#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ulaminate.h"

#define SIZE 4096 * 4096 * 128L
// _Alignas(32) static char arr[4096];
// static char src[4096];
// static char dest[4096];
// static unsigned arr1[] = {
//     1,
//     2, 2, 2, 2, 2, 2, 2, 2, 2,
//     3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 
//     4, 4, 4, 4, 4, 4, 
//     5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
//     6, 6, 6, 6, 6, 6, 6, 6, 
//     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 
//     8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 
//     9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 
//     10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 
// };

// static unsigned arr2[] = {
//     123,
//     2, 2343, 2, 2, 2, 2, 2, 2, 2,
//     342, 5, 9, 3, 3, 3, 3, 3, 3, 3, 3, 
//     4, 4, 4, 4, 4, 4, 
//     5, 5, 231, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
//     6, 6, 6, 124, 6, 6, 6, 6, 
//     7, 7, 7, 7, 343, 5465, 4343, 2323, 4355, 122, 333, 455, 7, 7, 7, 7, 7, 7, 
//     8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 
//     9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 
//     10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 
// };

// static void arithmetic_mean(unsigned *arr1, unsigned *arr2, unsigned *out, size_t sz){
//     unsigned sum = 0;
//     size_t idx = 0;
//     while(idx < sz){
//         sum += (arr1[idx] + arr2[idx]) >> 1;
//         out[idx] = sum;
//         idx++;
//     }
//     __asm__ __volatile__("" ::: "memory");
// }

int main(void){
    // test_tag_hit(SIZE);
    test_bubble_slots(SIZE);
    // unl_store_op_base_idx_disp(arr, 53285739457938475L, 16, SIZE);
    // unl_store_op_base_idx_disp2(arr, 53285739457938475L, 16, SIZE);
    // printf("%u\n", sum_less_then(sorted_arr, sizeof sorted_arr / sizeof(unsigned), 1));
    // for(size_t i = 0; i < 4096 * 2048; i++){
    //     sum_less_then(sorted_arr, sizeof sorted_arr / sizeof(unsigned), 1);
    // }
    // unlaminate_store_op_base_idx_disp(dest, src, 16, SIZE);
    // unsigned out[sizeof arr1 / sizeof(unsigned)];
    // for(size_t i = 0; i < 4096 * 4096; i++){
    //     arithmetic_mean(arr1, arr2, out, sizeof arr1 / sizeof(unsigned));
    // }
    // for(size_t i = 0; i < sizeof out / sizeof(unsigned); i++){
    //     printf("%u\n", out[i]);
    // }
    // inhibit_uops_cache(SIZE);
}