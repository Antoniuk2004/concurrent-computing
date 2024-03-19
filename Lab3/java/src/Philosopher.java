import java.util.concurrent.Semaphore;

public class Philosopher extends Thread {
    private final Semaphore leftFork;
    private final Semaphore rightFork;
    private final int id;

    public Philosopher(Semaphore leftFork, Semaphore rightFork, int id) {
        this.leftFork = leftFork;
        this.rightFork = rightFork;
        this.id = id;
        start();
    }

    @Override
    public void run() {
        try {
            System.out.printf("Philosopher with id %d is thinking.\n", id);
            rightFork.acquire();
            leftFork.acquire();
            System.out.printf("Philosopher with id %d started eating.\n", id);
            rightFork.release();
            leftFork.release();
            System.out.printf("Philosopher with id %d finished eating.\n", id);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}