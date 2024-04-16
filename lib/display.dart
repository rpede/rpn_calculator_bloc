import 'package:assignment1/calculator_cubit.dart';
import 'package:assignment1/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      bloc: context.read<CalculatorCubit>(),
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(state.rest.join(' ')),
          Text(
            key: const Key("Display"),
            state.top.toString(),
            style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          Text(
            state.inputText.toString(),
            style: const TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
