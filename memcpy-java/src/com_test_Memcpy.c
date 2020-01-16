#include <string.h>
#include <stddef.h>

#include "com_test_Memcpy.h"

JNIEXPORT void JNICALL Java_com_test_Memcpy_arrayMemcpy(JNIEnv *env,
                                                         jclass jc,
                                                         jbyteArray src,
                                                         jint srcOff,
                                                         jbyteArray dst,
                                                         jint dstOff,
                                                         jint len){
  void *native_arr_src = (*env)->GetPrimitiveArrayCritical(env, src, NULL);
  void *native_arr_dst = (*env)->GetPrimitiveArrayCritical(env, dst, NULL);
  memcpy((char *) native_arr_dst + dstOff, (char *) native_arr_src + srcOff, (size_t) len);
  (*env)->ReleasePrimitiveArrayCritical(env, dst, native_arr_dst, 0);
  (*env)->ReleasePrimitiveArrayCritical(env, src, native_arr_src, 0);
}

JNIEXPORT void JNICALL JavaCritical_com_test_Memcpy_arrayMemcpy(jint src_len,
                                                                jbyte *src,
                                                                jint src_off,
                                                                jint dst_len,
                                                                jbyte *dst,
                                                                jint dst_off,
                                                                jint len){
  memcpy((char *) dst + dst_off, (char *) src + src_off, (size_t) len);
}
