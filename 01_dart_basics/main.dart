main(){
  print("hello world");
  var a = 10;
  print(a);
  print(a.runtimeType); // int

String multiline = """
this is sharathchandra
i am looking for a job 
to fill my stomach
""";

  print(multiline);

  int num1 = 33;
  int num2 = 22;
  print("sum of the above code is: ${num1+num2}");

  String demo ="Sharath is hardworking";
  print(demo.toUpperCase());

  String anothreDemo = "SHARATH IS NOT SMART";
  print(anothreDemo.toLowerCase());
  
  String x = "demo statement check for caps";
  String xTitlecase = titleCase(x);
  print(xTitlecase);

  String rawString =r"sdemo \ dfef ";

}

String titleCase(String input){
  if(input.isEmpty) return input;

  List<String> words =   input.split(" ");
  List<String> sentence = words.map((w){
    if (w.isEmpty) return w;
    print(w[0]);
    return w[0].toUpperCase() + w.substring(1).toLowerCase();
  }).toList();

  return sentence.join(" ");
}