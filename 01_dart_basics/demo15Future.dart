// Error Handling: Use try-catch with await or .catchError() with .then() to handle errors.
Future<String> fetchData(){
  return Future.delayed(Duration(seconds: 2), ()=> "Data fetched");
}

void main() async{
  try{
    print("start");
    String data = await fetchData();
    print(data);
  }catch(err){
    print("error: $err");
  }finally{
    print("done");
  }
}