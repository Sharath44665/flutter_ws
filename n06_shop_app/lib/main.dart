import 'package:flutter/material.dart';
import 'package:n06_shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Transform.scale(
        scale:
            1.5, // remove after finish - running in linux app, so used this for 150% zoom
        child: HomePage(),
      ),
    );
  }
}
