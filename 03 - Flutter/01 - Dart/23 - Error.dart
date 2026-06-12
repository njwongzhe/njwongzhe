void main(List<String> args) {
  /* Syntax */ 
  /*
    try {
      // Code that might throw an exception. 
      // If exception occurs on any line, the line after will not run and directly jumps to the "catch" block.
    } catch (e) { // 'e' is the exception object catch from the "try" block.
      // Code to handle the exception. Runs if an exception occurs.
    } finally {
      // Code that always runs, regardless of whether an exception occurred or not.
    }
  */

  /* try-catch-finally (Success Case) */
  try {
    print("No Error");             
    print("Last Code in Try Block");     
  } catch (e) {                       // No error occurs, so this block is skipped.     
    print('An Error Occurred: $e'); 
  } finally {
    print('This block always runs.'); // Execute the "finally" block regardless of error occurrence.
  }

  print("");

  /* try-catch-finally (Error Case) */
  try {
    throw Exception("Error Message"); // Error // Manually throwing an exception for demonstration.
    print("Last Code in Try Block");  // This line will not execute due to the error above.
  } catch (e) {                       // 'e' is the exception object catch from the "try" block. "Exception("Error Message")"
    print('An Error Occurred: $e');   // Output: An Error Occurred: Exception: Error Message
  } finally {
    print('This block always runs.'); // Execute the "finally" block regardless of error occurrence.
  }
}