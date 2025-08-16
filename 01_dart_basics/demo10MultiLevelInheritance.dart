class Vehicle{
  void displayBase(){
    print("inside Base class - vehicle");
  }
}

class SixWheeler extends Vehicle{
  void displayIntermediary(){
    print("inside intermediary - SixWheeler");
  }
}

class FourWheeler extends SixWheeler{

}

void main(){
  var fourWheeler = FourWheeler();
  fourWheeler.displayBase();
  fourWheeler.displayIntermediary();
}