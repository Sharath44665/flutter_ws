void main(List<String> args) {
  Car myCar = Car();
  myCar.accelerate();
}

abstract class Vehicle {
  void accelerate();
}

class Car implements Vehicle {
  @override
  void accelerate() {
    print("car is accelerating");
  }
}
