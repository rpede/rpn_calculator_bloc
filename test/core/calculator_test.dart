import 'package:test/test.dart';
import 'package:assignment1/core/calculator.dart';

void main() {
  group("enter", () {
    test("pushes a number to the stack", () {
      final calculator = Calculator()..enter(1);
      expect(calculator.stack, [1]);
    });
  });
}