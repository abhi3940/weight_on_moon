import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double weight = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("rebuild");

    return MaterialApp(
      title: 'Weight on moon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.withOpacity(0.4),
          title: Text('weight on moon'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First section - Large Text
              Text(
                weight.toStringAsFixed(3),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              // Second section - Text Field
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    hintText: 'Enter your weight in kg',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Third section - Floating Action Button
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    double earthWeight =
                        double.parse(textEditingController.text);
                    weight = earthWeight * 0.165; // calculate weight on moon
                  });
                },
                child: const Icon(Icons.calculate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
