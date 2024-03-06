package org.example;

import java.util.Scanner;

public class Main {
    private static int test(int[] arr) {
        int sum = 0;
        for (int j : arr) {
            sum += j;
        }
        return sum;
    }

    public static void main(String[] args) throws InterruptedException {
        int[] arr = initializeArr(1000);

        System.out.println("Input number of threads:");
        int numOfThreads = Integer.parseInt(new Scanner(System.in).next());

        CalcManager calcManager = new CalcManager();
        calcManager.doCalculations(arr, numOfThreads);

        int sum = calcManager.getSum();
        System.out.println("Actual sum: " + sum);
        System.out.println("Brute-force sum: " + test(arr));
    }

    public static int[] initializeArr(int numOfElements) {
        int[] arr = new int[numOfElements];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = (int) Math.round(Math.random());
        }
        return arr;
    }
}