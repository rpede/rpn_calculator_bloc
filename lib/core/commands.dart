// Abstract Command class
abstract class Command {
  void apply(List<num> stack);
  void unapply(List<num> stack);
}

class PushCommand implements Command {
  final num value;

  PushCommand(this.value);

  @override
  void apply(List<num> stack) {
    stack.add(value);
  }

  @override
  void unapply(List<num> stack) {
    stack.removeLast();
  }
}

class ClearCommand implements Command {
  List<num>? _copy;
  @override
  void apply(List<num> stack) {
    _copy = [...stack];
    stack.clear();
  }

  @override
  void unapply(List<num> stack) {
    if (_copy == null) {
      throw StateError("$runtimeType haven't been applied");
    }
    stack.addAll(_copy!);
  }
}

// Avoid duplicating logic for each operation
abstract class OperatorCommand implements Command {
  late num operand1;
  late num operand2;

  num operate(num operand1, num operand2);

  @override
  void apply(List<num> stack) {
    if (stack.length >= 2) {
      operand2 = stack.removeLast();
      operand1 = stack.removeLast();
      stack.add(operate(operand1, operand2));
    }
  }

  @override
  void unapply(List<num> stack) {
    stack.removeLast();
    stack.addAll([operand1, operand2]);
  }
}

class AddCommand extends OperatorCommand {
  @override
  num operate(num operand1, num operand2) => operand1 + operand2;
}

class SubtractCommand extends OperatorCommand {
  @override
  num operate(num operand1, num operand2) => operand1 - operand2;
}

class MultiplyCommand extends OperatorCommand {
  @override
  num operate(num operand1, num operand2) => operand1 * operand2;
}

class DivideCommand extends OperatorCommand {
  @override
  num operate(num operand1, num operand2) => operand1 / operand2;
}
