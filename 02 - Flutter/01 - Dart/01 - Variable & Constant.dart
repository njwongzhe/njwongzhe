void main(List<String> args) {
  var data = 20;           // Data type of the variable will be fixed after the assign a value to it. (Smart Variable)
  print("data = ${data}"); // Output: data = 20

  data = 30;               // Modify the value in "data".
  print("data = ${data}"); // Output: data = 30

  // data = "String";     // Error since "data" only can store integer.
                          // Since an integer has been assigned to "data" at initial, the type of data cannot be change in future. 


  const constData = 40;              // "const" will be fixed once compile.
  // const constData = data;         // Error since a variable cannot be assigned to a constant.
  // constData = 30;                 // Error since data inside a constant cannot be changed. 
  print("constData = ${constData}"); // Output: constData = 40


  final finalData = "Final";            // "final" will be fixed once execute. (Someone call it.)
  print("finalData = ${finalData}");    // Output: finalData = Final

  final finalRuntime = data;            // Thus, variable can be assigned to a "final" at initial.
  print("finalData = ${finalRuntime}"); // Output: finalData = 30 // Value in "finalRuntime" is fixed now.
  data = 40;
  print("finalData = ${finalRuntime}"); // Output: finalData = 30
}