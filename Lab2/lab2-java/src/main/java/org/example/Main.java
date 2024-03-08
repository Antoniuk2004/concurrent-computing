package org.example;

import org.example.managers.ArrayManager;
import org.example.managers.MinValueManager;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        ArrayManager arrayManager = new ArrayManager();
        int[] arr = arrayManager.initializeArr(1000000);

        int numOfThreads = inputNumberOfThreads();

        StopWatch stopWatch = new StopWatch();
        MinValueManager minValueManager = new MinValueManager();
        stopWatch.start();
        MinElement minElement = minValueManager.findMinWithThreads(arr, numOfThreads);
        long passedTime = stopWatch.stop();
        output(minElement, passedTime);

        stopWatch.start();
        minElement = minValueManager.findMinValueWithOneLoop(arr);
        passedTime = stopWatch.stop();
        output(minElement, passedTime);
    }

    private static void output(MinElement minElement, long passedTime) {
        System.out.println("\nMin element: " + minElement.getValue());
        System.out.println("Min element index: " + minElement.getIndex());
        System.out.println("Passed time: %dms".formatted(passedTime));
    }

    private static int inputNumberOfThreads(){
        System.out.print("Enter the number of threads: ");
        int numOfThreads = Integer.parseInt(new Scanner(System.in).next());
        if(numOfThreads <= 0) {
            System.out.println("Enter the valid number of threads.");
            System.exit(0);
        }
        return numOfThreads;
    }
}