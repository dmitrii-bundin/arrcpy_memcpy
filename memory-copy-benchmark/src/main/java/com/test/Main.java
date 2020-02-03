package com.test;


import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.nio.ByteOrder;
import java.util.Arrays;

public class Main {
    public static void main(String args[]){
        VarHandle vh = MethodHandles.byteArrayViewVarHandle(long[].class, ByteOrder.LITTLE_ENDIAN);
        byte b[] = new byte[]{8, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0};
        byte c[] = new byte[16];
        Memcpy.gpiCopy(b, c, 16);
        System.out.println(Arrays.equals(b, c));
    }
}
