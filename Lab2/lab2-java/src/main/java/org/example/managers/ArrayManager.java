package org.example.managers;

import org.example.MinElement;

import java.util.Random;

public class ArrayManager {
    public int[] initializeArr(int numOfElements) {
        Random random = new Random();
        int[] arr = new int[numOfElements];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = random.nextInt();
        }
        return arr;
    }
}
