import 'package:assignment1/calculator_state.dart';
import 'package:assignment1/core/commands.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/calculator.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  Calculator calculator = Calculator();

  CalculatorCubit() : super(CalculatorState.empty());

  void number(String label) {
    String inputText = state.inputText;
    final input = double.tryParse(inputText + label.toString());
    if (input != null) {
      inputText += label.toString();
    }
    emit(state.copyWith(inputText: inputText));
  }

  void clear() {
    calculator.execute(ClearCommand());
    emit(state.copyWith(
        inputText: '', top: calculator.top(), rest: calculator.rest()));
  }

  void undo() {
    calculator.undo();
    emit(state.copyWith(
        inputText: '', top: calculator.top(), rest: calculator.rest()));
  }

  void appendInput() {
    String inputText = state.inputText;
    if (inputText.isNotEmpty) {
      calculator.execute(PushCommand(num.parse(inputText)));
      inputText = '';
    }
    emit(state.copyWith(
        inputText: inputText, top: calculator.top(), rest: calculator.rest()));
  }

  void remove() {
    final inputText =
        state.inputText.characters.take(state.inputText.length - 1).toString();
    emit(state.copyWith(inputText: inputText));
  }

  void enter() {
    String inputText = state.inputText;
    if (inputText.isEmpty) return;
    calculator.execute(PushCommand(num.parse(inputText)));
    inputText = '';
    emit(state.copyWith(
      inputText: inputText,
      top: calculator.top(),
      rest: calculator.rest(),
    ));
  }

  void add() => _operate(AddCommand());

  void subtract() => _operate(SubtractCommand());

  void multiply() => _operate(MultiplyCommand());

  void divide() => _operate(DivideCommand());

  void _operate(Command command) {
    String inputText = state.inputText;
    if (inputText.isNotEmpty) {
      calculator.execute(PushCommand(num.parse(inputText)));
      inputText = '';
    }
    calculator.execute(command);
    emit(state.copyWith(
        inputText: inputText, top: calculator.top(), rest: calculator.rest()));
  }
}
