package org.example;

public class MinElement {
    private int value;
    private int index;

    public MinElement() {
        this.value = Integer.MAX_VALUE;
        this.index = 0;
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
