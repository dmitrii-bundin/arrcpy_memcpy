package com.test;

import java.io.FileInputStream;
import java.io.InputStream;

public class Main {
    static final byte[] buffer = new byte[8 * 1024];

    static {
        System.loadLibrary("iocrit");
        System.loadLibrary("memcpy_java");
    }

    public static final int[] test[] = null;

    public static void main(String args[]) throws Exception {
        byte[] from = new byte[4096];
        System.out.println(test);
        byte[] to = new byte[4096];
        Memcpy.arrayMemcpy(from, 0, to, 0, from.length);
        while (true) {
            int fd = open("/tmp/test");
            long bytesRead = 0;
            int readCurrent;
            long start = System.nanoTime();
            while ((readCurrent = read(fd, buffer)) > 0) {
                bytesRead += readCurrent;
            }
            long end = System.nanoTime();
            System.out.println("Bytes read = " + bytesRead + ". Time elapsed = " + (end - start));
        }
    }

    private static native int open(String path);

    private static native int read(int fd, byte[] buf);
}
