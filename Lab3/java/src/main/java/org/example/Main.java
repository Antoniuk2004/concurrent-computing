package org.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
//        System.out.print("Enter the capacity of the storage: ");
//        int capacity = new Scanner(System.in).nextInt();
//        System.out.print("Enter the number of products: ");
//        int numberOfProducts = new Scanner(System.in).nextInt();
//        System.out.print("Enter the number of Producers: ");
//        int numberOfProducers = new Scanner(System.in).nextInt();
//        System.out.print("Enter the number of Consumers: ");
//        int numberOfConsumers = new Scanner(System.in).nextInt();

        int capacity = 3;
        int numberOfProducts = 10;
        int numberOfProducers = 3;
        int numberOfConsumers = 3;

        Storage storage = new Storage(capacity, numberOfProducts);
        Manager manager = new Manager(numberOfProducts, numberOfProducers, numberOfConsumers);

        int step = 0;
        while (manager.checkIfDone()) {
            int productsToProduce = manager.calcNumOfProductsToProduce();
            if(productsToProduce != 0) new Producer(storage, step, productsToProduce);

            int productsToConsume = manager.calcNumOfProductsToConsume();
            if(productsToConsume != 0) new Consumer(storage, step, productsToConsume);

            step++;
        }
    }
}
