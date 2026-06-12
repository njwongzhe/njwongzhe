void main(List<String> args) {
  /* while Loop (Pre-test Loop) */
  int i = 0;
  while (i < 3) {
    print('while Loop Iteration: $i');
    i++;
  }
  print("");

  /* do-while Loop (Post-test Loop) */
  int j = 0;
  do {
    print('do-while Loop Iteration: $j');
    j++;
  } while (j < 3);
  print("");

  /* for Loop (Pre-test Loop) */
  for (int k = 0; k < 3; k++) {
    print('for Loop Iteration: $k');
  }
}