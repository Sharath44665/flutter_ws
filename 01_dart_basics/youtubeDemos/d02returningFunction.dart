void main(List<String> args) {
  // arrow functions and anonymous functions also exist in flutter
  // In Dart, an anonymous function (also called a lambda, closure, or unnamed function) is a function without a name, defined inline and typically used for short, one-off operations. They are useful when you need to pass a function as an argument to another function (e.g., in event handlers, list operations like map, forEach, or where), or when you want to define a function on the fly without explicitly naming it.

  final val = printStuff();
  // print(val.runtimeType);
  print(val());
  // output of above:
  // hi there...
  // null
  print("===");
  val(); // hi there...
}

Function printStuff() {
  return () {
    print("hi there...");
  };
}
