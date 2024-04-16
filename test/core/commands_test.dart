import 'package:test/test.dart';
import 'package:assignment1/core/commands.dart';

void main() {
  group('PushCommand', () {
    test('Pushes a value to the stack', () {
      final stack = [1, 2];
      PushCommand(3).apply(stack);
      expect(stack, [1, 2, 3]);
    });
  });

  group('AddCommand', () {
    test('Remove the top two numbers and push the result', () {
      final stack = [1, 2];
      AddCommand().apply(stack);
      expect(stack, [3]);
    });

    test('Nothing if there are less than two numbers', () {
      final stack = [1];
      final copy = [...stack];
      AddCommand().apply(stack);
      expect(stack, copy);
    });
  });
}
