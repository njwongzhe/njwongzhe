void main(List<String> args) {
  int intNum = 1;            // A variable that only can accept integer.
  print("intNum = $intNum"); // Output: intNum = 1

  double douNum = 1.1;       // A variable that only can accept floating point.
  print("douNum = $douNum"); // Output: douNum = 1.1

  num numNum1 = intNum, numNum2 = douNum;          // A variable that only can accept both integer and floating point.
  print("intNum + douNum = ${numNum1 + numNum2}"); // Output: intNum + douNum = 2.1



  // intNum = douNum;          // Error since "intNum" is "int".
  intNum = douNum.toInt();     // Convert data type.
  intNum = numNum1.toInt();

  // douNum = intNum;          // Error since "douNum" is "double".
  douNum = intNum.toDouble();  // Convert data type.
  douNum = numNum1.toDouble();
}