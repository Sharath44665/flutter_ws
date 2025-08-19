void main(List<String> args) {
  String? someVal;
  print(someVal); // null
  someVal = "Sharathchandra";
  print(someVal);

  someVal = null;
  print(someVal?.length ?? 0); // 0

  someVal = "Sharath";
  print(someVal.length); // warning error but works

  String destination = "x";
  double weight = 6;
  double? charge;

  if (destination.toUpperCase() == "XYZ") {
    charge = weight * 5;
  } else if (destination.toUpperCase() == "ABC") {
    charge = weight * 7;
  } else if (destination.toUpperCase() == "PQR") {
    charge = weight * 10;
  }
  print(
    "your destination is: $destination and final charge: \$ ${charge ?? weight}",
  );
}
