import 'commands.dart';

// Invoker class for managing and executing commands
class Calculator {
  final List<num> stack = [];
  final List<Command> history = [];

  num top() {
    try {
      return stack.last;
    } on StateError {
      return 0;
    }
  }

  List<num> rest() {
    try {
      return stack.take(stack.length - 1).toList();
    } on RangeError {
      return const [];
    }
  }

  void execute(Command command) {
    command.apply(stack);
    history.add(command);
  }

  void undo() {
    if (history.isNotEmpty) {
      final lastCommand = history.removeLast();
      lastCommand.unapply(stack);
    }
  }
}
