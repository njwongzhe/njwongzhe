// Generics allow you to create classes that can operate on different data types while providing compile-time type safety.
// You can create classes that with same features but different data types of field or method without needing to write multiple versions.

class User {
  String name;
  User(this.name);
}

class Product {
  double price;
  Product(this.price);
}

class ApiResponse<T> { // "<T>" is a generic type parameter that accepts any data type.
  int? code;
  String? msg;
  T? data; // "T" will based on the data type pass to the "<T>" by the programmer when creating an instance.

  ApiResponse({this.code, this.msg, this.data});

  void display() {
    print("Code: $code, Message: $msg, Data: $data");
  }
}

// Without generics, we would need separate classes for each data type.
/*
class UserResponse {
  int code;
  String msg;
  User data; // "data" is specifically of type "User" and cannot be changed.

  UserResponse({required this.code, required this.msg, required this.data});
}
*/

// Without generics, we would need separate classes for each data type.
/*
class ProductResponse {
  int code;
  String msg;
  Product data; // "data" is specifically of type "Product" and cannot be changed.

  ProductResponse({required this.code, required this.msg, required this.data});
}
*/

void main(List<String> args) {
  ApiResponse<User> userResponse = ApiResponse<User>( // Programmer can determine the type of "T" when creating an instance.
    code: 200,
    msg: "User fetched successfully",
    data: User("Alice"), // "data" is type of "User" here since "T" is "User".
  );

  ApiResponse<Product> productResponse = ApiResponse<Product>( // Programmer can determine the type of "T" when creating an instance.
    code: 200,
    msg: "Product fetched successfully",
    data: Product(29.99), // "data" is type of "Product" here since "T" is "Product".
  );

  userResponse.display();    // Output: Code: 200, Message: User fetched successfully, Data: Instance of 'User'
  productResponse.display(); // Output: Code: 200, Message: Product fetched successfully, Data: Instance of 'Product'
}       