package org.example;

public class Consumer extends Thread {
    private final Storage storage;
    private final int numberOfProducts;

    public Consumer(Storage storage, int numberOfProducts) {
        this.storage = storage;
        this.numberOfProducts = numberOfProducts;
        start();
    }

    public void run() {
        for (int i = 0; i < numberOfProducts; i++) {
            try {
                storage.getEmptySemaphore().acquire();
                storage.getAccessSemaphore().acquire();

                Product product = storage.getElement();
                System.out.printf("Product with id %d was taken%n", product.getIndex());

                storage.getAccessSemaphore().release();
                storage.getFullSemaphore().release();
            }
            catch (InterruptedException e){
                throw new RuntimeException(e);
            }
        }
    }
}
