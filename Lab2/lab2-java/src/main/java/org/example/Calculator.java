package org.example;

public class Calculator extends Thread {
    private volatile int count;
    private int sum;
    private final int[] bounds;
    private final int[] arr;


    public Calculator(int[] arr, int threadIndex, int numOfThreads) {
        this.sum = 0;
        this.arr = arr;
        this.bounds = calcBounds(threadIndex, numOfThreads);
    }

    private int[] calcBounds(int threadIndex, int numOfThreads) {
        int oneThreadRange = Math.round(arr.length / numOfThreads);
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
            sum += arr[i];
        }
    }

    public void increment() {
        count++;
    }

    public void await() {
        while (count < ) {

        }
    }

    synchronized int getSum() {
        return this.sum;
    }
}
