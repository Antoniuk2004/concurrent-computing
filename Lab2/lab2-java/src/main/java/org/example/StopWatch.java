package org.example;

public class StopWatch {
    private long timeBefore;

    public void start(){
        this.timeBefore = System.currentTimeMillis();
    }

    public long stop(){
        long timeAfter = System.currentTimeMillis();
        return timeAfter - timeBefore;
    }
}
