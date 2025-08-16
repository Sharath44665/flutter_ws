class Cat{
  final String name;
  Cat(this.name);
}

extension Run on Cat {
  void run (){
    print("cat $name is running");
  }
}

// extension DemoRun on Cat{ // works
//   void demoMsg(){
//     print("cat $name is sent a message");
//   }
// }

class Person{
  final String fname;
  final String lname;

  Person(this.fname, this.lname);
}

extension fullName on Person{
  String get personFullName => "Full Name: $fname $lname";
}

void main(){
  final meow = Cat("kali");
  final demo = Cat("Sona");
  print(meow.name);
  meow.run(); // cat kali is running
  demo.run(); // cat Sona is running

  // meow.demoMsg();
  // demo.demoMsg();

  final userOne = Person("Sharath", "chandra");
  print(userOne.personFullName);
}