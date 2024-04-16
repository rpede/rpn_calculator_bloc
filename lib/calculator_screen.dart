import 'package:flutter/material.dart';

import 'core/calculator.dart';
import 'display.dart';
import 'main.dart';

class RpnCalculatorScreen extends StatefulWidget {
  const RpnCalculatorScreen({super.key});

  @override
  _RpnCalculatorScreenState createState() => _RpnCalculatorScreenState();
}

class _RpnCalculatorScreenState extends State<RpnCalculatorScreen> {
  Calculator calculator = Calculator();
  String inputText = '';
  late List<List<ButtonDef>> buttons;

  @override
  void initState() {
    super.initState();
    buttons = [
      [
        ("Undo", () => _onOperation(calculator.undo)),
        ("Clear", () => _onClear()),
        ("Rem", () => _onRemove()),
        ('/', () => _onOperation(calculator.divide)),
      ],
      [
        ('7', () => _onNumber('7')),
        ('8', () => _onNumber('8')),
        ('9', () => _onNumber('9')),
        ('*', () => _onOperation(calculator.multiply)),
      ],
      [
        ('4', () => _onNumber('4')),
        ('5', () => _onNumber('5')),
        ('6', () => _onNumber('6')),
        ('-', () => _onOperation(calculator.subtract)),
      ],
      [
        ('1', () => _onNumber('1')),
        ('2', () => _onNumber('2')),
        ('3', () => _onNumber('3')),
        ('+', () => _onOperation(calculator.add)),
      ],
      [
        ("", null),
        ('0', () => _onNumber('0')),
        ('.', () => _onNumber('.')),
        ("Enter", () => _onEnter()),
      ],
    ];
  }

  void _onNumber(String label) {
    final input = double.tryParse(inputText + label.toString());
    if (input != null) {
      setState(() {
        inputText += label.toString();
      });
    }
  }

  void _onOperation(void Function() operation) {
    setState(() {
      if (inputText.isNotEmpty) {
        calculator.enter(num.parse(inputText));
        inputText = '';
      }
      operation();
    });
  }

  void _onEnter() {
    if (inputText.isNotEmpty) {
      setState(() {
        calculator.enter(num.parse(inputText));
        inputText = '';
      });
    }
  }

  void _onRemove() {
    setState(() {
      inputText = inputText.characters.take(inputText.length - 1).toString();
    });
  }

  void _onClear() {
    setState(() {
      calculator.clear();
      inputText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPN Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 2,
              child: Display(calculator: calculator, inputText: inputText),
            ),
            ..._buildButtons()
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _buildButtons() {
    return [
      for (final row in buttons)
        Flexible(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final btn in row)
                Expanded(flex: 1, child: _buildButton(btn)),
            ],
          ),
        )
    ];
  }

  Widget _buildButton(ButtonDef e) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        key: Key(e.$1),
        onPressed: e.$2,
        child: Text(e.$1),
      ),
    );
  }
}
