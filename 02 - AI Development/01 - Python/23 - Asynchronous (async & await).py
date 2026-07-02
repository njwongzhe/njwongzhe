# Asynchronous Programming in Python (async & await)
# Asynchronous programming allows your program to perform other tasks while waiting 
# for an operation (like I/O, database queries, or network requests) to complete.
# Python provides the "asyncio" module for writing single-threaded concurrent code.

import asyncio
import time

# 1. Defining a Coroutine
# Prefix the function definition with "async def".
# Calling an async function does NOT execute it immediately; it returns a "coroutine" object.

async def fetch_data(task_id, delay):
    print(f"Task {task_id}: Started fetching...")
    # asyncio.sleep simulates a non-blocking network delay.
    # The "await" keyword pauses the coroutine and allows other tasks to run.
    await asyncio.sleep(delay)
    print(f"Task {task_id}: Done fetching data!")
    return {f"data_{task_id}": "value"}

# 2. Running a Coroutine (asyncio.run)
# You cannot call an async function normally in synchronous code.
# Use asyncio.run() to establish the main entry point and run the event loop.

async def main():
    start_time = time.time()
    
    # Example A: Sequential Execution (Slow)
    # The code waits for fetch_data(1) to finish before starting fetch_data(2).
    # val1 = await fetch_data(1, 2)
    # val2 = await fetch_data(2, 3)
    
    # Example B: Concurrent Execution using asyncio.gather (Fast!)
    # Both tasks start and run concurrently, cooperating during sleeps.
    print("--- Starting Concurrent Tasks ---")
    results = await asyncio.gather(
        fetch_data(1, 2),
        fetch_data(2, 3)
    )
    
    end_time = time.time()
    print("Results:", results)
    print(f"Total execution time: {end_time - start_time:.2f} seconds")
    # Total time will be approx 3 seconds (the longest delay), rather than 2 + 3 = 5 seconds!

# Entry Point
if __name__ == "__main__":
    # Runs the event loop to execute the coroutine main()
    asyncio.run(main())
