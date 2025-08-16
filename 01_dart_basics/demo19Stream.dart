// Transforming Streams

void main(){
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4]);

  numbers.where((numValues)=> numValues%2 == 0)
  .map((val) => val*2)
  .listen((val) => print(val));
}