package org.example.managers;

import java.util.concurrent.CountDownLatch;

public class MinValueFinderParams {
    private int[] arr;
    private int index;
    private int numOfThreads;
    private CountDownLatch latch;

    public int[] getArr() {
        return arr;
    }

    public void setArr(int[] arr) {
        this.arr = arr;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getNumOfThreads() {
        return numOfThreads;
    }

    public void setNumOfThreads(int numOfThreads) {
        this.numOfThreads = numOfThreads;
    }

    public CountDownLatch getLatch() {
        return latch;
    }

    public void setLatch(CountDownLatch latch) {
        this.latch = latch;
    }
}
