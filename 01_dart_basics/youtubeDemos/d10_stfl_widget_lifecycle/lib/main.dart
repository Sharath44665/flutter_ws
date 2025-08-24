import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "statefulWidget lifecycle demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  // constructor
  _CounterWidgetState() {
    debugPrint("constructor called");
  }

  @override
  void initState() {
    super.initState();
    debugPrint("initstate called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies called");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build called");
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful widget lifecycle demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter Value: "),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter += 1;
                });
              },
              child: const Text("Increment Counter"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget called");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    debugPrint("setState called");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate called");
  }

  @override
  void dispose() {
    debugPrint("dispose called");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("reassemble called");
  }
}
