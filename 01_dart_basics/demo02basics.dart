void main() {
  var someValue = "demo";
  print(someValue.length);
  // someValue = 322; // this is compile time err: A value of type 'int' can't be assigned to a variable of type 'String'.

  final someVal2 = 23434;
  const constVal = 234242;
  /*
  someVal2 = 100; // The final variable 'someVal2' can only be set once.
  constVal =
      200; // Constant variables can't be assigned a value after initialization.

*/

  final nowVal = DateTime.now();
  // const demoNow = DateTime.now(); // CANT assign a const at run time

  print(nowVal);
}
