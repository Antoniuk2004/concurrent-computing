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
        int numberOfProducers = 123;
        int numberOfConsumers = 34;

        Storage storage = new Storage(capacity, numberOfProducts);
        Manager manager = new Manager(numberOfProducts, numberOfProducers, numberOfConsumers);

        int step = 0;
        while (manager.checkIfDone()) {
            new Producer(storage, step, manager);
            new Consumer(storage, step, manager);

            step++;
        }
    }
}
