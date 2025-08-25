import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int counter = 0;
  final TextEditingController textEditingController = TextEditingController();

  void increment() {
    String valueText = textEditingController.text;

    if (valueText.isEmpty) {
      counter += 1;
    } else {
      counter += int.parse(valueText);
    }
    setState(() {});
  }

  void decrement() {
    String valueText = textEditingController.text;

    if (valueText.isEmpty) {
      counter -= 1;
    } else {
      counter -= int.parse(valueText);
    }
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 2.0, style: BorderStyle.solid),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 217, 251, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(148, 57, 218, 1),
        foregroundColor: Colors.white,
        title: const Text("Counter", style: TextStyle(fontSize: 33)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$counter", style: TextStyle(fontSize: 44)),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "increment digit by 1, 2, 3...",
                  enabledBorder: border,
                  focusedBorder: border,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Enter the number",
                ),
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(59, 15, 92, 1),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(59, 15, 92, 1),
                      // minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: increment,
                    child: const Text(
                      "Increment +",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(205, 165, 245, 1),
                    ),
                    onPressed: decrement,
                    child: const Text(
                      "Decrement -",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("By default, it will be increment or decrement by 1"),
            ],
          ),
        ),
      ),
    );
  }
}
