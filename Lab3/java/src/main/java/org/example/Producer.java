package org.example;

public class Producer extends Thread {
    private final Storage storage;
    private final int id;
    private final int numOfIterations;

    public Producer(Storage storage, int step, Manager manager) {
        this.storage = storage;
        this.id = step;

        this.numOfIterations = manager.calcNumOfProductsToProduce(step);
        if (numOfIterations > 0) start();
    }

    public void run() {
        for (int i = 0; i < numOfIterations; i++) {
            try {
                storage.getFullSemaphore().acquire();
                storage.getAccessSemaphore().acquire();

                storage.addElement(new Product(i));
                System.out.printf("Producer with id %d put the product with id %d%n", id, i);

                storage.getAccessSemaphore().release();
                storage.getEmptySemaphore().release();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}