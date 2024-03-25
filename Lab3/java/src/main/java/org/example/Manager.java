package org.example;

public class Manager {
    private final int productsPerProducer;
    private int remainingProductsProducer;

    private final int productsPerConsumer;
    private int remainingProductsConsumer;

    private int reamingProducers;
    private int reamingConsumers;

    private final boolean isNumOfProducersMoreThanNumOfProducts;
    private final boolean isNumOfConsumersMoreThanNumOfProducts;

    private final int extraProductsForProducers;
    private final int extraProductsForConsumers;


    public Manager(int numberOfProducts, int numberOfProducers, int numberOfConsumers) {
        this.productsPerProducer = numberOfProducts / numberOfProducers;
        this.remainingProductsProducer = numberOfProducts % numberOfProducers;

        this.productsPerConsumer = numberOfProducts / numberOfConsumers;
        this.remainingProductsConsumer = numberOfProducts % numberOfConsumers;

        this.isNumOfProducersMoreThanNumOfProducts = numberOfProducers <= numberOfProducts;
        this.isNumOfConsumersMoreThanNumOfProducts = numberOfConsumers <= numberOfProducts;

        this.reamingProducers = numberOfProducers;
        this.reamingConsumers = numberOfConsumers;

        this.extraProductsForProducers = numberOfProducts - numberOfProducers * productsPerProducer;
        this.extraProductsForConsumers = numberOfProducts - numberOfConsumers * productsPerConsumer;
    }

    public int calcNumOfProductsToProduce(int step) {
        if (reamingProducers <= 0) return 0;

        reamingProducers--;
        if (isNumOfProducersMoreThanNumOfProducts) {
            if (step < extraProductsForProducers) return productsPerProducer + 1;
            else return productsPerProducer;
        }

        if (remainingProductsProducer > 0) {
            remainingProductsProducer--;
            return productsPerProducer + 1;
        }

        return productsPerProducer;
    }

    public int calcNumOfProductsToConsume(int step) {
        if (reamingConsumers <= 0) return 0;

        reamingConsumers--;
        if (isNumOfConsumersMoreThanNumOfProducts) {
            if (step < extraProductsForConsumers) return productsPerConsumer + 1;
            else return productsPerConsumer;
        }

        if (remainingProductsConsumer > 0) {
            remainingProductsConsumer--;
            return productsPerConsumer + 1;
        }

        return productsPerConsumer;
    }

    public boolean checkIfDone() {
        return reamingProducers > 0 || reamingConsumers > 0;
    }
}
