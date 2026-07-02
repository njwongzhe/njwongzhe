// Asynchronous & Multithreading: Running operations concurrently and asynchronously.

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

// Helper runnable task.
class Task implements Runnable {
    private String name;

    public Task(String name) {
        this.name = name;
    };

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running: " + name);
        try {
            TimeUnit.MILLISECONDS.sleep(200); // Simulate some work.
        } catch (InterruptedException e) {
            System.out.println("Task was interrupted.");
        }
        System.out.println(Thread.currentThread().getName() + " finished: " + name);
    };
}

class AsyncDemo {
    public static void main(String[] args) {
        /* 1. Basic Multithreading (Thread & Runnable) */
        System.out.println("--- 1. Basic Threads ---");
        Thread thread1 = new Thread(new Task("Task 1"));
        Thread thread2 = new Thread(new Task("Task 2"));
        
        thread1.start(); // Starts execution of thread1 in a separate call stack.
        thread2.start(); // Starts execution of thread2 in a separate call stack.

        try {
            thread1.join(); // Wait for thread1 to complete.
            thread2.join(); // Wait for thread2 to complete.
        } catch (InterruptedException e) {
            System.out.println("Main thread interrupted.");
        }
        System.out.println();

        /* 2. Thread Pools (ExecutorService) */
        System.out.println("--- 2. ExecutorService ---");
        // Creates a thread pool with fixed threads. Good for resource management.
        ExecutorService executor = Executors.newFixedThreadPool(2);
        
        executor.submit(new Task("Executor Task A"));
        executor.submit(new Task("Executor Task B"));
        executor.submit(new Task("Executor Task C"));

        executor.shutdown(); // Refuses new tasks but runs submitted tasks.
        try {
            // Blocks until all tasks complete after shutdown, or timeout occurs.
            if (!executor.awaitTermination(1, TimeUnit.SECONDS)) {
                executor.shutdownNow(); // Force shut down if tasks take too long.
            }
        } catch (InterruptedException e) {
            executor.shutdownNow();
        }
        System.out.println();

        /* 3. Asynchronous Programming (CompletableFuture) */
        System.out.println("--- 3. CompletableFuture (Async Operations) ---");
        
        // supplyAsync executes task asynchronously on the common thread pool ForkJoinPool.commonPool().
        CompletableFuture<String> asyncFetch = CompletableFuture.supplyAsync(() -> {
            System.out.println("Async thread name: " + Thread.currentThread().getName());
            try {
                TimeUnit.MILLISECONDS.sleep(300); // Simulate network latency fetching data.
            } catch (InterruptedException e) {
                System.out.println("Async work interrupted.");
            }
            return "User Profile Data";
        });

        // thenApply() processes result of previous stage (similar to map/then in JS).
        CompletableFuture<String> asyncProcess = asyncFetch.thenApply(data -> {
            return data + " (Processed)";
        });

        // thenAccept() consumes final result when complete.
        CompletableFuture<Void> asyncConsumer = asyncProcess.thenAccept(processedData -> {
            System.out.println("Async Final Consumer Output: " + processedData);
        });

        // exceptionally() handles exceptions if any stage in the chain fails.
        CompletableFuture<String> asyncErrorHandling = CompletableFuture.supplyAsync(() -> {
            if (true) {
                throw new RuntimeException("Simulated Database Failure.");
            }
            return "Valid Data";
        }).exceptionally(ex -> {
            System.out.println("Error handled: " + ex.getMessage());
            return "Fallback Default Data";
        });

        // Block main thread to wait for async completions (only for demo purposes).
        asyncConsumer.join();
        System.out.println("Fallback Output: " + asyncErrorHandling.join());
    }
}
