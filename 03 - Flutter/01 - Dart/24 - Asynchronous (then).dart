// "Future" is a Dart class representing a value that will be available at some point in the future.
// There is three state of a "Future":
// 1. Uncompleted          : The "Future" is still running and has not yet produced a value.
// 2. Completed with Value : The "Future" has finished successfully and produced a value.
// 3. Completed with Error : The "Future" has finished with an error.

// A uncompleted "Future" (State 1) can be in waiting state for asynchronous operations like file I/O, network requests, timers, etc.
// It will turn to completed state (with value or error) once the operation is done without blocking the main thread.
// Which means when a "Future" is waiting for an asynchronous operation, other code that not dependent on that "Future" can continue to run in the main thread.

// A completed "Future" with value (State 2) will pass that value to the next "then" block in the chain and repeat until the end of the chain.
// A completed "Future" with error (State 3) will skip all subsequent "then" blocks and go to the nearest "catchError" block for error handling.

/* Functional Programming Syntax */
/*
  Future(() {
    // Your code here.
    // Return a value or another Future. Return value will be passed to the parameter of next "then" block.
  }).then((value) {
    // Your code here.
    // Return a value or another Future. Return value will be passed to the parameter of next "then" block.
  }).then((value) {
    // Your code here.
    // End of chain, no need to return anything.
  }).catchError((e) { 
    // Error handling here. 
  }).whenComplete(() {
    // Code that runs regardless of success or error.
  });
*/

// A "then" block must be completed before the next "then" block can run.
// However, other code (like another "Future" chain) can run in between if the first chain is waiting for an asynchronous operation to complete.
// "catchError" is handle errors method in the "Future" class. (Different from "catch" but same feature.)
// "whenComplete" is a method in the "Future" class that runs regardless of success or error in the "Future" chain (Different from "finally" but same feature.)

// As conclusion, "Future" as asynchronous programming allow concurrent execution between multiple tasks.
// In command-prompt based system, the sequence of output may looks confusing since the terminal only shows one line at a time.
// It will be clearer in GUI-based system where multiple outputs can appear simultaneously in different parts of the UI.


Future<String> printData() { // If without "<String>", it defaults to "Future<dynamic>".
// Future.delayed(duration, callback); 
  // "duration" is how long to wait before executing the "callback". (Duration class used here.)
  // "callback" is the function to run after the delay.
  return Future.delayed(Duration(seconds: 5), () => "Some Data");
}

Future<String> someMoreData() {
  return Future(() => "Some More Data");
}

Future<String> otherData() {
  return Future(() => "Other Data");
}

Future<String> otherMoreData() {
  return Future.delayed(Duration(seconds: 1), () => "Other More Data");
}

void main() {
  Future chain1 = Future(() {
    print("Starting Chain 1");
    return printData();
  }); // We can seperate the first "Future" and the "then" chain for better readability.

  chain1.then((some) {
    print(some);     // Output: Some Data
    return someMoreData();
  }).then((someMore) {
    print(someMore); // Output: Some More Data
  });


  Future chain2 = Future(() {
    print("Starting Chain 2");
    return otherData();
  }); // We can seperate the first "Future" and the "then" chain for better readability.

  chain2.then((other) {
    print(other);     // Output: Other Data
    return otherMoreData();
  }).then((otherMore) {
    print(otherMore); // Output: Other More Data
  });

  /*
    Output: Starting Chain 1
            Starting Chain 2
            Other Data
            Other More Data
            Some Data
            Some More Data
    
    Explanation:
    - Although Chain 1 starts first, it waits for 5 seconds to complete "printData()".
    - During this waiting period, Chain 2 starts and completes quickly since "otherData()" has no delay.
    - Thus, Chain 2's outputs appear before Chain 1's outputs.
    - Chain 1 that requires more time to complete will output its results later.
    - Chain 1 does not block Chain 2 from executing although Chain 2 attempts to run after Chain 1.
  */
}

/*
  Extra Methods:
  1. Future.value(value)        : Creates a Future that is already completed with the given value. Why use? To wrap a synchronous value in a Future.
  2. Future.error(error)        : Creates a Future that is already completed with the given error. Why use? To wrap a synchronous error in a Future.
  3. Future.wait(listOfFutures) : Waits for multiple Futures to complete and returns a Future that completes with a list of their results. 
                                  Why use? To run multiple asynchronous operations in parallel and wait for all to finish.
  4. Future.any(listOfFutures)  : Returns a Future that completes with the result of the first Future in the list that completes.
                                  Why use? To get the result of the fastest asynchronous operation among several.
*/