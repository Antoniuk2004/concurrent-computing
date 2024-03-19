import java.util.Scanner;
import java.util.concurrent.Semaphore;

public class Main {
    public static void main(String[] args) {
        System.out.print("Enter the number of philosophers: ");
        int numOfPhilosophers = new Scanner(System.in).nextInt();

        Semaphore[] arrOfForkSemaphores = createForkSemaphores(numOfPhilosophers);

        for (int i = 0; i < numOfPhilosophers; i++) {
            Semaphore leftFork = arrOfForkSemaphores[i % numOfPhilosophers];
            Semaphore rightFork = arrOfForkSemaphores[(i + 1) % numOfPhilosophers];

            if (i % 2 == 0) new Philosopher(leftFork, rightFork, i);
            else new Philosopher(rightFork, leftFork, i);
        }
    }

    private static Semaphore[] createForkSemaphores(int num) {
        Semaphore[] arrOfForkSemaphores = new Semaphore[num];

        for (int i = 0; i < num; i++) {
            arrOfForkSemaphores[i] = new Semaphore(1);
        }

        return arrOfForkSemaphores;
    }
}