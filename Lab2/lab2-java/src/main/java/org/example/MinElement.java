package org.example;

public class MinElement {
    private int value;
    private int index;

    public MinElement() {
        this.value = Integer.MAX_VALUE;
        this.index = 0;
    }

    synchronized public void tryToChange(int value, int index) {
        if (value < this.value) {
            this.value = value;
            this.index = index;
        }
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
