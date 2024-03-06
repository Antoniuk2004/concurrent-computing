package org.example;

public class Calculator extends Thread {
    private final int id;
    private long sum;
    private final Breaker breaker;

    public Calculator(int id, Breaker breaker) {
        this.breaker = breaker;
        this.id = id;
        this.sum = 0;
    }

    @Override
    public void run() {
        while (!breaker.isCanBeStopped()) {
            sum += 1;
        }
        System.out.println("Thread %d sum: %d".formatted(id, sum));
    }
}
