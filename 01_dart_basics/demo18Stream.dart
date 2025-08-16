// Using async* for Stream Generators

Stream<int> countStream(int max) async*{
  for(int i=1; i<= max; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main(){
  countStream(3).listen((val) => print(val)); // Prints 1, 2, 3 with 1-second delays
}
