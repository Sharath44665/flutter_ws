import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> jsonData = await readJsonFile();
    // print('First name: ${jsonData['fname']}');
    // print("${data.fname}");
    readJsonFileTwo();
    // print("${jsonData.fname}");
    return const Placeholder();
  }
}

Future<Map<String, dynamic>> readJsonFile() async {
  try {
    final String response = await rootBundle.loadString("data/data.json");
    // final Map<String, dynamic> data = jsonDecode(response);

    return jsonDecode(response);
  } catch (e) {
    throw Exception("Failed to load json file: $e");
  }
}

readJsonFileTwo() async {
  try {
    final file = File("./data/data.json");
    String contents = await file.readAsString();
    var jsonData = jsonDecode(contents);
    // print("fname : ${jsonData['fname']}");
    return jsonData;
  } catch (e) {
    print(e.toString());
  }
}
