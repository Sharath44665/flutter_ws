/*
1. Synchronous Generators (sync*)
- Used to generate a sequence of values that can be iterated over synchronously.
- Returns an Iterable<T>, which can be used in a for loop or with methods like forEach.
- Uses the sync* keyword and yield to produce values

 */

Iterable<int> countUpTo(int max) sync*{
  for(int i=1; i<=max; i++){
    yield i;
  }
}

void main(){
  var numbers = countUpTo(3);
  for(var number in numbers){
    print(number);
  }
}