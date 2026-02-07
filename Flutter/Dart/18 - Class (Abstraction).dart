/* Abstract Class */
abstract class PayBase { // Abstraction only do the declaration of methods but not the implementation.
  void pay();
}

/* Implementing Class */
class Tng implements PayBase {
  @override
  void pay() {
    print("Paying with TnG.");
  }
}

/* Implementing Class */
class Boost implements PayBase {
  @override
  void pay() {
    print("Paying with Boost.");
  }
}

void main(List<String> args) {
  PayBase payment1 = Tng();
  payment1.pay(); // Output: Paying with TnG.

  PayBase payment2 = Boost();
  payment2.pay(); // Output: Paying with Boost.
}