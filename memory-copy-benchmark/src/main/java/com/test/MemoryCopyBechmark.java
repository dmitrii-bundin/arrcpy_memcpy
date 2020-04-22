/*
 * Copyright (c) 2014, Oracle America, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 *  * Neither the name of Oracle nor the names of its contributors may be used
 *    to endorse or promote products derived from this software without
 *    specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

package com.test;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.Channels;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@State(value = Scope.Benchmark)
public class MemoryCopyBechmark {

    //8MB, 16MB, 32MB
    @Param({"8388608", "16777216", "33554432"})
    public int size;

    @Param({"16"})
    public int threshold;

    public byte src[];
    public byte dest[];

    public int tst[];

    @Setup
    public void generateData() throws IOException {
        tst = new int[]{
                1, 1, 1, 1, 1, 1, 1, 1,
                2, 2, 2, 2, 2, 2, 2, 2,
                3, 3, 3, 3, 3, 3, 3, 3,
                4, 4, 4, 4, 5, 5, 5, 5,
                5, 5, 5, 5, 5, 5, 5, 5,
                5, 5, 5, 5, 5, 6, 6, 6,
                6, 6, 7, 7, 7, 7, 7, 7,
                7, 7, 7, 7, 8, 8, 9, 9,
                10, 10, 10, 10, 10, 10, 11, 11,
                12, 12, 12, 12, 12, 12, 12, 12,
                13, 13, 13, 13, 13, 13, 13, 13,
                13, 13, 13, 13, 13, 13, 13, 14,
                14, 14, 14, 14, 14, 14, 14, 14,
                15, 15, 15, 15, 15, 15, 15, 15,
                15, 15, 15, 15, 15, 15, 15, 15,
                16, 16, 16, 16, 16, 16, 16, 16
        };
        src = new byte[size];
        dest = new byte[size];
        InputStream is = Channels.newInputStream(Files.newByteChannel(Paths.get("/dev/urandom")));
        int bytesRead = 0;
        while(bytesRead < size){
            bytesRead += is.read(src, bytesRead, size - bytesRead);
        }
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @OutputTimeUnit(TimeUnit.MICROSECONDS)
    @Measurement(time = 1)
    @Warmup(time = 1)
    @Fork(value = 1, warmups = 1)
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int sumLt() {
        int sum = 0;
        final int thr = threshold;
        for(int i: tst){
            if(i > thr){
                return sum;
            }
            sum += i;
        }
        return sum;
    }
//    @Benchmark
//    @BenchmarkMode(Mode.AverageTime)
//    @OutputTimeUnit(TimeUnit.MICROSECONDS)
//    @Measurement(time = 1)
//    @Warmup(time = 1)
//    @Fork(value = 1, warmups = 1)
//    public void arraycopy() {
//        System.arraycopy(src, 0, dest, 0, size);
//    }
//
//    @Benchmark
//    @BenchmarkMode(Mode.AverageTime)
//    @OutputTimeUnit(TimeUnit.MICROSECONDS)
//    @Measurement(time = 1)
//    @Warmup(time = 1)
//    @Fork(value = 1, warmups = 1)
//    public void erms() {
//        Memcpy.arrayErms(src, 0, dest, 0, size);
//    }
//
//    @Benchmark
//    @BenchmarkMode(Mode.AverageTime)
//    @OutputTimeUnit(TimeUnit.MICROSECONDS)
//    @Measurement(time = 1)
//    @Warmup(time = 1)
//    @Fork(value = 1, warmups = 1)
//    public void memcpy() {
//        Memcpy.arrayMemcpy(src, 0, dest, 0, size);
//    }
//
//    @Benchmark
//    @BenchmarkMode(Mode.AverageTime)
//    @OutputTimeUnit(TimeUnit.MICROSECONDS)
//    @Measurement(time = 2)
//    @Warmup(time = 2)
//    @Fork(value = 1, warmups = 1)
//    public void gpiCpy() {
//        Memcpy.gpiCopy(src, dest, size);
//    }
}