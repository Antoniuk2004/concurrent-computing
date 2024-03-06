package org.example;

public class Breaker extends Thread {
    volatile private boolean canBeStopped;

    public Breaker() {
        canBeStopped = false;
        start();
    }

    @Override
    public void run() {
        try {
            Thread.sleep(5000);
            canBeStopped = true;
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isCanBeStopped() {
        return canBeStopped;
    }
}
