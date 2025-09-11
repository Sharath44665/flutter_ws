import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Some data demo",
          style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
