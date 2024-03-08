package org.example;

import org.example.managers.MinValueFinderParams;

import java.util.concurrent.CountDownLatch;

public class MinValueFinder extends Thread {
    private final int[] bounds;
    private final MinElement minElement;
    private final int[] arr;
    private final CountDownLatch latch;

    public MinValueFinder(MinValueFinderParams params) {
        this.arr = params.getArr();
        this.bounds = calcBounds(params.getIndex(), params.getNumOfThreads());
        this.latch = params.getLatch();
        this.minElement = new MinElement();
        start();
    }

    private int[] calcBounds(int threadIndex, int numOfThreads) {
        int oneThreadRange = (arr.length / numOfThreads);
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
                minElement.setValue(arr[i]);
                minElement.setIndex(i);
            }
        }
        latch.countDown();
    }

    public MinElement getMin() {
        return minElement;
    }
}
