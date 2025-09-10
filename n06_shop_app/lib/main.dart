import 'package:flutter/material.dart';
import 'package:n06_shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Shop App", home: HomePage());
  }
}
