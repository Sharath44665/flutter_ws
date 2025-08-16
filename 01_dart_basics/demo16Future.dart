// Chaining Futures: You can chain multiple asynchronous operations using .then() or multiple await statements.

Future<int> step1() => Future.value(1);
Future<int> step2(int val) => Future.value(val+1);

void main() async{
  int result = await step1().then((val)=> step2(val));
  print(result); // 2
}