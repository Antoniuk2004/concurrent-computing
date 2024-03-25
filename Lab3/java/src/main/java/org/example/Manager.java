package org.example;

public class Manager {
    private final int productsPerProducer;
    private int remainingProductsProducer;

    private final int productsPerConsumer;
    private int remainingProductsConsumer;

    private int totalProducers;
    private int totalConsumers;

    private final boolean producersBool;
    private final boolean consumersBool;

    public Manager(int numberOfProducts, int numberOfProducers, int numberOfConsumers) {
        this.productsPerProducer = numberOfProducts / numberOfProducers;
        this.remainingProductsProducer = numberOfProducts % numberOfProducers;

        this.productsPerConsumer = numberOfProducts / numberOfConsumers;
        this.remainingProductsConsumer = numberOfProducts % numberOfConsumers;

        producersBool = numberOfProducers <= numberOfProducts;
        consumersBool = numberOfConsumers <= numberOfProducts;

        this.totalProducers = numberOfProducers;
        this.totalConsumers = numberOfConsumers;
    }

    public int calcNumOfProductsToProduce() {
        if (totalProducers <= 0) return 0;

        int productsToProduce = productsPerProducer;
        if (producersBool) {
            totalProducers--;
            return productsToProduce;
        }

        if (remainingProductsProducer > 0) {
            productsToProduce++;
            remainingProductsProducer--;
        }
        totalProducers--;

        return productsToProduce;
    }

    public int calcNumOfProductsToConsume() {
        if (totalConsumers <= 0) return 0;

        int productsToConsume = productsPerConsumer;
        if (consumersBool) {
            totalConsumers--;
            return productsToConsume;
        }

        if (remainingProductsConsumer > 0) {
            productsToConsume++;
            remainingProductsConsumer--;
        }
        totalConsumers--;

        return productsToConsume;
    }

    public boolean checkIfDone() {
        return totalProducers > 0 || totalConsumers > 0;
    }
}
