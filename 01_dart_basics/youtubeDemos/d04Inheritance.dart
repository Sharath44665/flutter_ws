void main(List<String> args) {
  Car tataCar = Car();
  tataCar.display();
  print(tataCar.speed); // 10
  tataCar.accelerate();
  print(tataCar.speed); // 20

  Vehicle truck = Truck();
  (truck as Truck).display(); // 8
  // treat truck as class of Truck
}

class Vehicle {
  int speed = 10;
  bool isEngineWorking = true;
  bool isLightOn = false;

  void accelerate() {
    speed += 10;
  }
}

class Car extends Vehicle {
  int wheels = 4;
  void display() {
    print("number of Wheels: $wheels");
  }
}

class Truck extends Vehicle {
  int wheels = 8;
  void display() {
    print("number of wheeels: $wheels");
  }
}
