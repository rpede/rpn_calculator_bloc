import 'package:assignment1/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_screen.dart';

typedef ButtonDef = (String, void Function()?);

void main() {
  runApp(BlocProvider(
    create: (context) => CalculatorCubit(),
    child: const CalculatorApp(),
  ));
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
