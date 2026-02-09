// "async" and "await" are keywords that provide a declarative way to define asynchronous functions.
// They act as "Syntactic Sugar" for the ".then()" style which making asynchronous code look like synchronous code. (Improves readability.)

// Key Concepts:
// 1. async : Marks a function as asynchronous. It allows you to use the "await" keyword inside it.
//            An "async" function always returns a "Future" automatically.
// 2. await : Pauses the execution of the current function until the "Future" completes.
//            It only pauses the function it is inside, not the entire application.

/* Syntax */
/*
  Future<void> asyncFunction() async {
    try {
      var result1 = await asyncFunction1();
      var result2 = await asyncFunction2(result1);
      // More sequential async calls...
    } catch (e) {
      // Handle errors.
    } finally {
      // Code that runs regardless of success or error.
    }
  }
*/
  
// "async" and "await" must be used together.
// Different "async" functions can run concurrently if they are not awaited immediately one after another.
// Basic concepts is similar to "then" chains but with better readability and error handling using "try-catch-finally".


Future<String> printData() {
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

/* Represents "Chain 1" Logic Using "async" & "await" */
Future<void> runChain1() async {
  print("Starting Chain 1");

  try {
    String some = await printData();
    print(some);     // Output: Some Data 

    String someMore = await someMoreData();
    print(someMore); // Output: Some More Data
  } catch (e) {
    // No handling errors specifically here, but could be done.
  }
}

/* Represents "Chain 2" Logic Using "async" & "await" */
Future<void> runChain2() async {
  print("Starting Chain 2");

  try {
    String other = await otherData();
    print(other);     // Output: Other Data

    String otherMore = await otherMoreData();
    print(otherMore); // Output: Other More Data

  } catch (e) {
    // No handling errors specifically here, but could be done.
  }
}

void main() {  
  runChain1(); // Start Chain 1
               // It runs until it hits the first 'await' (5s delay), then it yields control back here.

  runChain2(); // Start Chain 2
               // It starts immediately. It does not wait for Chain 1 to finish.

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