package org.example;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class CalcManager {
    public List<Calculator> calcThreads;

    public CalcManager() {
        this.calcThreads = new ArrayList<>();
    }

    public void doCalculations(int[] arr, int numOfThreads) {
        for (int i = 0; i < numOfThreads; i++) {
            Calculator calc = new Calculator(arr, i, numOfThreads);
            calcThreads.add(calc);
            calc.run();
        }
    }

    public int getSum() {
        int sum = 0;
        for (Calculator calcThread : calcThreads) {
            sum += calcThread.getSum();
        }
        return sum;
    }
}
