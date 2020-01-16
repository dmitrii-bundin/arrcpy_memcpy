package com.test;

public class Memcpy {
    private Memcpy(){ }

    static {
        System.loadLibrary("memcpy_java");
    }

    public static native void arrayMemcpy(byte src[], int srcOff, byte dst[], int dstOff, int len);
}