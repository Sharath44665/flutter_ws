// a mixin is a way to reuse a class's code in multiple class hierarchies
//without requiring traditional inheritance.
//It allows you to share methods and properties across different classes,
//promoting code reuse while maintaining flexibility.
//Mixins are particularly useful in Dart because the language supports single inheritance
// (a class can only extend one superclass), but mixins provide a way to
// add functionality from multiple sources.

void main(List<String> args) {
  Bird parrot = Bird();
  parrot.eat();
  parrot.fly();
  parrot.walk();

  Bird crow = Bird();
  crow.swim();
}

mixin Flyable {
  void fly() {
    print("I can fly");
  }
}

mixin Walkable {
  void walk() {
    print("I can walk");
  }
}

mixin Swimmer {
  void swim(); // abstract  method
}

class Animal {
  void eat() {
    print("i can eat");
  }
}

class Bird extends Animal with Flyable, Walkable, Swimmer {
  @override
  void swim() {
    // abstract method implementation
    print("I can swim");
  }
}
