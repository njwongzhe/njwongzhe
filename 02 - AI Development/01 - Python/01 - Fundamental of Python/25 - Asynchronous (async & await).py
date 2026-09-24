# ------------------------------------------------------------> 
# Asynchronous Programming (async, await)
# ------------------------------------------------------------> 
# Asynchronous programming allows tasks (like I/O, database, or network requests) to run concurrently without blocking execution.
# - async: Define a coroutine.
# - await: Pause execution of the current coroutine until the awaited coroutine completes.

import asyncio # Library for writing concurrent code using the async / await syntax.
import time

# ---> Defining a Coroutine (async def)
# Prefixing a function with 'async def' creates a coroutine.
# Calling an async function returns a coroutine object; it does not execute immediately.

async def fetch_data(task_id, delay):
    print(f"Task {task_id}: Started fetching...")
    # asyncio.sleep simulates a non-blocking delay. 'await' pauses this task to let others run.
    await asyncio.sleep(delay)
    print(f"Task {task_id}: Completed in {delay}s")
    return {f"data_{task_id}": "value"}

# ---> Running Coroutines (asyncio.run & asyncio.gather)

async def main():
    start_time = time.time()
    
    # asyncio.gather runs multiple coroutines concurrently.
    print("--- Starting Concurrent Tasks ---")
    results = await asyncio.gather(
        fetch_data(1, 2),
        fetch_data(2, 3)
    )
    
    end_time = time.time()
    print("Results:", results)
    print(f"Total execution time: {end_time - start_time:.2f}s")
    # Total time is ~3s (the maximum delay) instead of 2s + 3s = 5s.

# ---> Entry Point
if __name__ == "__main__":
    # asyncio.run creates the event loop and executes the main coroutine.
    asyncio.run(main())