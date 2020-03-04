package com.test;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.nio.ByteOrder;

public class Memcpy {
    private Memcpy(){ }

    private static final VarHandle byteArrayVarHandle = MethodHandles.byteArrayViewVarHandle(long[].class, ByteOrder.LITTLE_ENDIAN);

    static {
        System.loadLibrary("memcpy_java");
    }

    public static native void arrayMemcpy(byte src[], int srcOff, byte dst[], int dstOff, int len);

    public static native void arrayErms(byte src[], int srcOff, byte dst[], int dstOff, int len);

    public static void gpiCopy(byte src[], byte dst[], int len){
        if((len & 0x7) != 0)
            throw new IllegalArgumentException("Unsupported len");
        int bytesCopied = 0;
        while(bytesCopied < len){
            long lv = (long) byteArrayVarHandle.get(src, bytesCopied);
            byteArrayVarHandle.set(dst, bytesCopied, lv);
            bytesCopied += 8;
        }
    }
}