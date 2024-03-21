package org.example;

public class Consumer extends Thread {
    private final Storage storage;

    public Consumer(Storage storage) {
        this.storage = storage;
        start();
    }

    public void run() {
        try {
            storage.getEmptySemaphore().acquire();
            storage.getAccessSemaphore().acquire();

            Product product = storage.getElement();
            System.out.printf("Product with id %d was taken%n", product.getIndex());

            storage.getAccessSemaphore().release();
            storage.getFullSemaphore().release();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
