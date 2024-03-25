package org.example;

public class Consumer extends Thread {
    private final Storage storage;
    private final int id;
    private final int numOfIterations;

    public Consumer(Storage storage, int id, int numOfIterations) {
        this.storage = storage;
        this.id = id;
        this.numOfIterations = numOfIterations;

        start();
    }

    public void run() {
        for (int i = 0; i < numOfIterations; i++) {
            try {
                storage.getEmptySemaphore().acquire();
                storage.getAccessSemaphore().acquire();

                Product product = storage.getElement();
                System.out.printf("Consumer with id %d took the product with id %d%n", id, product.getIndex());

                storage.getAccessSemaphore().release();
                storage.getFullSemaphore().release();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
