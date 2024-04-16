import 'package:flutter/material.dart';

import 'calculator_screen.dart';

typedef ButtonDef = (String, void Function()?);

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RpnCalculatorScreen(),
    );
  }
}