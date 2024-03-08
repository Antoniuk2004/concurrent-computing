package org.example.managers;

import org.example.MinValueFinder;
import org.example.MinElement;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class MinValueManager {
    public MinElement findMinWithThreads(int[] arr, int numOfThreads) throws InterruptedException {
        List<MinValueFinder> minValueFinders = doSearch(arr, numOfThreads);
        return getMinOfThreadsValues(minValueFinders);
    }

    private List<MinValueFinder> doSearch(int[] arr, int numOfThreads) throws InterruptedException {
        List<MinValueFinder> minValueFinders = new ArrayList<>();
        CountDownLatch latch = new CountDownLatch(numOfThreads);
        for (int i = 0; i < numOfThreads; i++) {
            MinValueFinderParams params = new MinValueFinderParams();
            params.setArr(arr);
            params.setIndex(i);
            params.setNumOfThreads(numOfThreads);
            params.setLatch(latch);

            MinValueFinder calc = new MinValueFinder(params);
            minValueFinders.add(calc);
        }
        latch.await();
        return minValueFinders;
    }

    public MinElement getMinOfThreadsValues(List<MinValueFinder> minValueFinders) {
        MinElement globalMinElement = new MinElement();
        for (MinValueFinder minValueFinder : minValueFinders) {
            MinElement threadMin = minValueFinder.getMin();
            if (threadMin.getValue() < globalMinElement.getValue()) {
                globalMinElement = threadMin;
            }
        }
        return globalMinElement;
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
