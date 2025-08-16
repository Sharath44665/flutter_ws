class Person {
  String? firstName;
  String? lastName;
  bool? isFemale;

  // default
  Person(this.firstName, this.lastName);

  // named constructor
  Person.owner() {
    firstName = "Sharath";
    lastName = "Chandra";
  }

  void display() {
    print("full name: $firstName $lastName");
  }

  void checkGender() {
    if (isFemale == true) {
      print("Yes, i am Female");
    } else {
      print(" i m male");
    }
  }
}

void demoFunction() {
  var personOne = Person("demofName", "demoLname");
  personOne.display();
  personOne.checkGender();

  personOne.firstName = "Radha";
  personOne.lastName = "Krishna";
  personOne.display();
  print("-----");

  final personOwner = Person.owner();
  personOwner.display();
}

void main() {
  demoFunction();
}
