package org.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int numOfThreads = inputNumberOfThreads();
        Breaker breaker = new Breaker();
        for (int i = 0; i < numOfThreads; i++) {
            new Calculator(i, breaker).start();
        }
    }

    private static int inputNumberOfThreads() {
        int numOfThreads = 0;
        try {
            System.out.print("Enter the number of threads: ");
            return new Scanner(System.in).nextInt();
        } catch (Exception e) {
            System.out.println("Please enter the valid number of threads.");
        }
        return numOfThreads;
    }
}