package org.example.managers;

import org.example.MinValueFinder;
import org.example.MinElement;

import java.util.List;
import java.util.concurrent.CountDownLatch;

public class MinValueManager {
    public MinElement findMinWithThreads(int[] arr, int numOfThreads) throws InterruptedException {
        MinElement minElement = new MinElement();
        CountDownLatch latch = new CountDownLatch(numOfThreads);

        int oneThreadRange = (arr.length / numOfThreads);

        for (int i = 0; i < numOfThreads; i++) {
            MinValueFinderParams params = new MinValueFinderParams();
            params.setArr(arr);
            params.setIndex(i);
            params.setNumOfThreads(numOfThreads);
            params.setLatch(latch);
            params.setMinElement(minElement);
            params.setOneThreadRange(oneThreadRange);

            new MinValueFinder(params);
        }
        latch.await();
        return minElement;
    }

    public MinElement findMinValueWithOneLoop(int[] arr) {
        MinElement minElement = new MinElement();
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < minElement.getValue()) {
                minElement.setValue(arr[i]);
                minElement.setIndex(i);
            }
        }
        return minElement;
    }
}
