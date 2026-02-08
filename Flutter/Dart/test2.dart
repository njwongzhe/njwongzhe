// "Future" is a core Dart class representing a value that will be available at some point in the future.

void printData() {
  print("Some Data");
}

Future<void> printMoreData() async {
  await Future.delayed(Duration(seconds: 5));
  print("Some More Data");
}

void otherData() {
  print("Other Data");
}

void otherMoreData() {
  print("Other More Data");
}

void main() {
  Future f = Future(() {
    print("Starting someData");
    printData();
  });
  f.then((_) {
    printMoreData();
  });

  Future g = Future(() {
    print("Starting otherData");
    otherData();
  });
  g.then((_) {
    otherMoreData();
  });
}


