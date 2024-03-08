package org.example.managers;

import org.example.MinElement;

import java.util.concurrent.CountDownLatch;

public class MinValueFinderParams {
    private int[] arr;
    private int index;
    private int numOfThreads;
    private CountDownLatch latch;
    private MinElement minElement;
    private int oneThreadRange;

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

    public MinElement getMinElement() {
        return minElement;
    }

    public void setMinElement(MinElement minElement) {
        this.minElement = minElement;
    }

    public int getOneThreadRange() {
        return oneThreadRange;
    }

    public void setOneThreadRange(int oneThreadRange) {
        this.oneThreadRange = oneThreadRange;
    }
}
