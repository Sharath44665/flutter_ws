void main(){
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, ]);
  numbers.listen(
      (data) => print("data $data"),
      onError: (err) => print("error: $err"),
    onDone: ()=> print("stream closed"),
  );
}