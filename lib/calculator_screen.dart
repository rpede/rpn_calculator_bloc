import 'package:assignment1/buton_grid.dart';
import 'package:assignment1/display.dart';
import 'package:flutter/material.dart';

class RpnCalculatorScreen extends StatelessWidget {
  const RpnCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPN Calculator'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(flex: 1, child: Display()),
            Flexible(flex: 2, child: ButtonGrid())
          ],
        ),
      ),
    );
  }
}
