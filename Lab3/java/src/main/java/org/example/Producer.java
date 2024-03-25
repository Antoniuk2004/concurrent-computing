package org.example;

public class Producer extends Thread {
    private final Storage storage;
    private final int id;
    private final int numOfIterations;

    public Producer(Storage storage, int id, int numOfIterations) {
        this.storage = storage;
        this.id = id;
        this.numOfIterations = numOfIterations;

        start();
    }

    public void run() {
        int productId = 0;
        for (int i = 0; i < numOfIterations; i++) {
            try {
                storage.getFullSemaphore().acquire();
                storage.getAccessSemaphore().acquire();

                storage.addElement(new Product(productId));
                System.out.printf("Producer with id %d put the product with id %d%n", id, id);

                storage.getAccessSemaphore().release();
                storage.getEmptySemaphore().release();
                productId++;
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}