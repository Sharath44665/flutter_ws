// In Dart, a Future represents a value or error that will be available at some point in the future, typically as a result of an asynchronous operation. It’s a core part of Dart’s asynchronous programming model, used to handle operations that take time to complete, like fetching data from a network, reading a file, or performing a database query. A Future is Dart’s way of handling asynchronous computations, allowing your program to continue executing other tasks while waiting for the operation to complete.

Future<String> fetchData(){
  return Future.delayed(Duration(seconds: 2), ()=> "Data fetched");
}

void main(){
  print("Starting...");
  fetchData().then((data) => print(data));
  print("continuing...");

  // output:
  // Starting...
  // continuing...
  // Data fetched
}