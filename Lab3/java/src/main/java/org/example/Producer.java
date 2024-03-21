package org.example;

public class Producer extends Thread {
    private final Storage storage;
    private final int id;

    public Producer(Storage storage, int id) {
        this.storage = storage;
        this.id = id;
        start();
    }

    public void run() {
        try {
            storage.getFullSemaphore().acquire();
            storage.getAccessSemaphore().acquire();

            storage.addElement(new Product(id));
            System.out.printf("Product with id %d was added%n", id);

            storage.getAccessSemaphore().release();
            storage.getEmptySemaphore().release();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
