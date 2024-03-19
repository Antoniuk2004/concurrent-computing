package org.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.print("Enter the capacity of the storage: ");
        int capacity = new Scanner(System.in).nextInt();
        System.out.print("Enter the number of products: ");
        int numberOfProducts = new Scanner(System.in).nextInt();

        Storage storage = new Storage(capacity);
        new Producer(storage, numberOfProducts);
        new Consumer(storage, numberOfProducts);
    }
}