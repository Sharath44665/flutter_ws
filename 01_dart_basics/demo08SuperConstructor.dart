class SuperDemo{
  SuperDemo(){
    print("inside parent constructor");
  }
}
class Demo extends SuperDemo{
  Demo(){
    print("inside child constructor");
  }
}

void main(){
  Demo demo = new Demo();

  // inside parent constructor
  // inside child constructor

  PersonChild child =  PersonChild();
  // inside parent
  // name: Akash
  // inside child constructor


}


// Explicit super
class Person{
  Person(String name){
    print("inside parent");
    print("name: $name");
  }
}

class PersonChild extends Person{
  PersonChild(): super("Akash"){
    print("inside child constructor");
  }
}


