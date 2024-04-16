import 'package:assignment1/calculator_cubit.dart';
import 'package:assignment1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonGrid extends StatefulWidget {
  const ButtonGrid({super.key});

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  late List<List<ButtonDef>> buttons;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CalculatorCubit>();
    buttons = [
      [
        ("Undo", () => cubit.undo()),
        ("Clear", () => cubit.clear()),
        ("Rem", () => cubit.remove()),
        ('/', () => cubit.divide()),
      ],
      [
        ('7', () => cubit.number('7')),
        ('8', () => cubit.number('8')),
        ('9', () => cubit.number('9')),
        ('*', () => cubit.multiply()),
      ],
      [
        ('4', () => cubit.number('4')),
        ('5', () => cubit.number('5')),
        ('6', () => cubit.number('6')),
        ('-', () => cubit.subtract()),
      ],
      [
        ('1', () => cubit.number('1')),
        ('2', () => cubit.number('2')),
        ('3', () => cubit.number('3')),
        ('+', () => cubit.add()),
      ],
      [
        ("", null),
        ('0', () => cubit.number('0')),
        ('.', () => cubit.number('.')),
        ("Enter", () => cubit.enter()),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in buttons)
          Flexible(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final btn in row)
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        key: Key(btn.$1),
                        onPressed: btn.$2,
                        child: Text(btn.$1),
                      ),
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }
}
