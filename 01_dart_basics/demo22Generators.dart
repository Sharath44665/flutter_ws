/*
Asynchronous Generators (async*)
- Used to generate a sequence of values asynchronously, often for data that arrives over time (e.g., network or file data).
- Returns a Stream<T>, which can be listened to using listen or processed with await for.
- Uses the async* keyword and yield to emit values.

 */
Stream<int> countUptoSync(int max) async*{
  for(int i=1; i<=max; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async{
  await for(var number in countUptoSync(3)){
    print(number);
  }
}