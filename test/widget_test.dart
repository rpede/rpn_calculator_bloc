// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:assignment1/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assignment1/main.dart';

void main() {
  testWidgets('Enter a number', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    expect(find.displayNumber(), equals(0));

    await tester.enterNumber(5);

    expect(find.displayNumber(), equals(5));
  });

  testWidgets('Addition', (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    await tester.enterNumber(2);
    await tester.enterNumber(2);
    await tester.tapByKey(const Key("+"));

    expect(find.displayNumber(), equals(4));
  });

  testWidgets("Subtraction", (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    await tester.enterNumber(3);
    await tester.enterNumber(1);
    await tester.tapByKey(const Key("-"));

    expect(find.displayNumber(), equals(2));
  });

  testWidgets("Multiplication", (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    await tester.enterNumber(5);
    await tester.enterNumber(5);
    await tester.tapByKey(const Key("*"));

    expect(find.displayNumber(), equals(25));
  });

  testWidgets("Division", (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    await tester.enterNumber(99);
    await tester.enterNumber(3);
    await tester.tapByKey(const Key("/"));

    expect(find.displayNumber(), equals(33));
  });

  testWidgets("Multiple operations", (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => CalculatorCubit(),
      child: const CalculatorApp(),
    ));

    await tester.enterNumber(5);
    await tester.enterNumber(2);
    await tester.enterNumber(3);
    await tester.tapByKey(const Key("+"));
    expect(find.displayNumber(), equals(5));
    await tester.tapByKey(const Key("*"));
    expect(find.displayNumber(), equals(25));
  });
}

extension FinderExtensions on CommonFinders {
  num? displayNumber() {
    final text = byKey(const Key("Display")).evaluate().single.widget as Text;
    return num.tryParse(text.data ?? "");
  }
}

extension TesterExtensions on WidgetTester {
  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
    await pump();
  }

  Future<void> enterNumber(num value) async {
    for (var char in value.toString().characters) {
      await tapByKey(Key(char));
      await pump();
    }
    await tapByKey(const Key("Enter"));
  }
}
