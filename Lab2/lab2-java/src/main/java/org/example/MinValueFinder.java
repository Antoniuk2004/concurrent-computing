package org.example;

import org.example.managers.MinValueFinderParams;

import java.util.concurrent.CountDownLatch;

public class MinValueFinder extends Thread {
    private final int[] bounds;
    private final MinElement minElement;
    private final int[] arr;
    private final CountDownLatch latch;
    private final int oneThreadRange;

    public MinValueFinder(MinValueFinderParams params) {
        this.arr = params.getArr();
        this.bounds = calcBounds(params.getIndex(), params.getNumOfThreads());
        this.latch = params.getLatch();
        this.minElement = params.getMinElement();
        this.oneThreadRange = params.getOneThreadRange();
        start();
    }

    private int[] calcBounds(int threadIndex, int numOfThreads) {
        int lowerBound = oneThreadRange * threadIndex;
        int upperBound;
        if (threadIndex == numOfThreads - 1) {
            upperBound = arr.length;
        } else {
            upperBound = lowerBound + oneThreadRange;
        }
        return new int[]{lowerBound, upperBound};
    }

    @Override
    public void run() {
        for (int i = bounds[0]; i < bounds[1]; i++) {
            if (arr[i] < minElement.getValue()) {
                minElement.tryToChange(arr[i], i);
            }
        }
        latch.countDown();
    }
}
