#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#include "com_test_Main.h"

JNIEXPORT jint JNICALL Java_com_test_Main_open(JNIEnv *env, jclass jc, jstring path){
    const char *native_path = (*env)->GetStringUTFChars(env, path, NULL);
    int fd = open(native_path, O_RDONLY);
    (*env)->ReleaseStringUTFChars(env, path, native_path);
    return fd;
}

JNIEXPORT jint JNICALL Java_com_test_Main_read(JNIEnv *env, jclass jc, jint fd, jbyteArray arr){
    size_t java_array_size = (size_t) (*env)->GetArrayLength(env, arr);
    void *buf = (*env)->GetPrimitiveArrayCritical(env, arr, NULL);
    ssize_t bytes_read = read(fd, buf, java_array_size);
    (*env)->ReleasePrimitiveArrayCritical(env, arr, buf, 0);
    return (jint) bytes_read;
}

JNIEXPORT jint JNICALL JavaCritical_com_test_Main_read(jint fd, jint java_array_size, jbyte *buf){
    return (jint) read(fd, buf, (size_t) java_array_size);
}