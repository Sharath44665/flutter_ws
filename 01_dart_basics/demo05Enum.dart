enum PersonProperties{
  firstName, lastName, age
}

void enumDemo(){
  print(PersonProperties.firstName); // PersonProperties.firstName
  print(PersonProperties.firstName.name ); // firstName
}

void main(){
  enumDemo();
}