abstract class Animal{
  void speak();

  factory Animal(String type){
    if (type == "dog") return Dog();
    if (type == "cat") return Cat();
    throw UnsupportedError("Unknown animal type");
  }
}

class Dog implements Animal{
  void speak() => print("bow bow...");
}

class Cat implements Animal{
  @override
  void speak() {
    print("Meow meow");
  }

}

void main(){
  Animal dog = Animal("dog");
  Animal cat = Animal("cat");

  dog.speak();
  cat.speak();

  print(identical(dog, cat)); // false
}