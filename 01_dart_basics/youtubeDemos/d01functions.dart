void main() {
  var someVal = getSomeValue();
  print(someVal);
  print(someVal.runtimeType);

  print(someVal.$2); // 22

  final (thing, price, isStatus) = someVal;
  print(thing);
  print(price);
  print(isStatus);

  printThingName(thingName: "sunglass", price: 33);
  print("---");
  // for below one, you can change the argument order
  printThingName(
    thingName: "Sugar",
    price: 44,
    isDiscout: true,
  ); //calling by named argument

  var value = someStuff();
  // print(value.runtimeType);
  print("---");
  print(value.item);
  print(value.cost);
  print(value.discount);
}

// return two or more datatypes from a functions
(String, int, bool) getSomeValue() {
  return ("unbrella", 22, true);
}

// named arguments
void printThingName({
  required String thingName,
  required int price,
  bool? isDiscout,
}) {
  print(thingName);
  print(price);
  print(isDiscout ?? "discount not applied this item");
}

({String item, int cost, bool? discount}) someStuff() {
  return (item: "laptop", cost: 22000, discount: null);
}
