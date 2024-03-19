package org.example;

public class Producer extends Thread{
    private final Storage storage;
    private final int numberOfProducts;

    public Producer(Storage storage, int numberOfItems) {
        this.storage = storage;
        this.numberOfProducts = numberOfItems;
        start();
    }

    public void run(){
        for(int i = 0; i < numberOfProducts; i++){
            try {
                storage.getFullSemaphore().acquire();
                storage.getAccessSemaphore().acquire();

                storage.addElement(new Product(i));
                System.out.printf("Product with id %d was added%n", i);

                storage.getAccessSemaphore().release();
                storage.getEmptySemaphore().release();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
