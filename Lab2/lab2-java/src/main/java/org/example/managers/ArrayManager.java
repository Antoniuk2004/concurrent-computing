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
//        return test(numOfElements);
    }

    private int[] test(int numOfElements){
        int[] arr = new int[numOfElements];

        int step = 0;
        for (int i = numOfElements; i < numOfElements; i--) {
            arr[step] = i;
        }

        arr[numOfElements / 2] = -100;

        return arr;
    }
}
