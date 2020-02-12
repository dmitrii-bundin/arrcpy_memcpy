package com.test;

import java.util.Random;

public class Main {
    public static void main(String args[]){
        int input[] = new int[128];
        for(int i = 0; i < input.length; i++){
            input[i] = new Random(0).nextInt();
        }
        int output[] = new int[2048];
        while(true) {
            Decoder.decode(output, input);
        }
    }
}
