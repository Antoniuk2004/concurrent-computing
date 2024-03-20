package org.example;

import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.concurrent.Semaphore;

public class Storage {
    private final Queue<Product> products = new LinkedList<>();
    private final Semaphore access;
    private final Semaphore full;
    private final Semaphore empty;

    public Storage(int capacity) {
        this.access = new Semaphore(1);
        this.full = new Semaphore(capacity);
        this.empty = new Semaphore(0);
    }

    public Product getElement() {
        return products.poll();
    }

    public void addElement(Product product) {
        products.offer(product);
    }

    public Semaphore getAccessSemaphore() {
        return access;
    }

    public Semaphore getFullSemaphore() {
        return full;
    }

    public Semaphore getEmptySemaphore() {
        return empty;
    }
}