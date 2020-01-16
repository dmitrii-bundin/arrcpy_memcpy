package com.test;

import java.io.InputStream;
import java.nio.channels.Channels;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Main {
    public static void main(String args[]) throws Exception{
        int size = 8192;

        byte src[] = new byte[size];
        byte dest[] = new byte[size];
        InputStream is = Channels.newInputStream(Files.newByteChannel(Paths.get("/dev/urandom")));
        int bytesRead = 0;
        while(bytesRead < size){
            bytesRead += is.read(src, bytesRead, size - bytesRead);
        }
        while(true) {
            Memcpy.arrayMemcpy(src, 0, dest, 0, size);
        }
    }
}
