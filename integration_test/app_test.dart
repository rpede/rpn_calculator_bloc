// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:assignment1/test_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Enter a number', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyCalculatorApp());

    // Find widget by key and cast to `Text`
    final text =
        find.byKey(const Key("Display")).evaluate().single.widget as Text;
    // `text.data` is the string that is displayed by the text widget
    expect(text.data, equals(''));

    // Convert the number we want to enter to a string.
    // Then loop over the digits.
    for (final digit in '123'.characters) {
      // Find the corresponding button for a digit and tap it.
      await tester.tap(find.byKey(Key(digit)));
      // Trigger update
      await tester.pump();
    }

    // We now expect a widget with the text "123"
    expect(find.text("123"), findsOneWidget);
  });

  testWidgets('Enter a number', (tester) async {
    await tester.pumpWidget(const MyCalculatorApp());

    expect(find.displayText(), equals(''));
    await tester.enterDigits('123');
    expect(find.displayText(), equals('123'));
  });
}

extension FinderExtensions on CommonFinders {
  String? displayText() {
    final text = byKey(const Key("Display")).evaluate().single.widget as Text;
    return text.data;
  }
}

extension TesterExtensions on WidgetTester {
  Future<void> enterDigits(String digits) async {
    for (var digit in digits.characters) {
      await tapByKey(Key(digit));
    }
  }

  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
    await pump();
  }
}
