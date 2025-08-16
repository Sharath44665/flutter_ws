import 'dart:convert';
import 'dart:io';

void main() async{
  var file = File("demoFile.txt");
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  await for( var val in lines){
    print(val);
  }
}