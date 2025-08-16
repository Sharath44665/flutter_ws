// Async and Await: The modern way to work with Futures is using async and await, which makes asynchronous code look synchronous and easier to read.

Future<String> fetchData(){
  return Future.delayed(Duration(seconds: 2), ()=> "Data fetched!");
}

void main() async{
  print("starting...");
  String data = await fetchData();
  print(data);
  print("done!");
}