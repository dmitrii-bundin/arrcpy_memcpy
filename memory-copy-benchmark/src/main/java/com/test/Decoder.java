package com.test;

public class Decoder {

    private Decoder(){ }

    static{
        System.loadLibrary("decode");
    }

    public static native void decode(int output[], int input[]);
}
