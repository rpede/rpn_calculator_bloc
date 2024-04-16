import 'package:flutter/material.dart';

import 'core/calculator.dart';

class Display extends StatelessWidget {
  final Calculator calculator;
  final String inputText;

  const Display({super.key, required this.calculator, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(calculator.rest().join(' ')),
        Text(
          key: const Key("Display"),
          calculator.top().toString(),
          style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        Text(
          inputText.toString(),
          style: const TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }
}
