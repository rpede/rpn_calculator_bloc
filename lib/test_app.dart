import 'package:flutter/material.dart';

class MyCalculatorApp extends StatefulWidget {
  const MyCalculatorApp({super.key});

  @override
  State<MyCalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<MyCalculatorApp> {
  var value = "";

  _appendDigit(String digit) {
    setState(() {
      value += digit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(key: Key("Display"), value),
            for (final digit in "123".characters)
              TextButton(
                key: Key(digit),
                child: Text(digit),
                onPressed: () => _appendDigit(digit),
              ),
          ],
        ),
      ),
    );
  }
}
