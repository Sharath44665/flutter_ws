class Car {
  void output(){
    print("inside parent class");
  }
}

class Mini extends Car{

}

void main(){
  var mini = Mini();
  mini.output();
}