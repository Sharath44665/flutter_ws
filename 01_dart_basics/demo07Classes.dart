class Person{
  String? name;

  // private static instance
  static final Person _instance = Person._internal("Person");

  // private named constructor
  Person._internal(this.name);

  // Factory constructor
  factory Person(){
    return _instance;
  }

  void display(){
    print("Name: $name");

  }
}

void main(){
  var instance1 = Person();
  var instance2 = Person();

  instance1.display(); // Person
  print(identical(instance1, instance2)); // true

}