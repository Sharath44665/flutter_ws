void main(List<String> args) {
  // ability to take object many forms.
  Animal animal = Cat();
  animal.makeSound(); // Cat is making sound
  animal = Dog();
  animal.makeSound(); // Dog is making sound
}

class Animal {
  void makeSound() {
    print("Animal is making sound");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat is making sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog is making sound");
  }
}
