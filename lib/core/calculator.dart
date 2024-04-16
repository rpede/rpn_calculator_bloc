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

  Iterable<num> rest() {
    try {
      return stack.take(stack.length - 1);
    } on RangeError {
      return const [];
    }
  }

  void enter(num value) {
    execute(PushCommand(value));
  }

  void add() {
    execute(AddCommand());
  }

  void subtract() {
    execute(SubtractCommand());
  }

  void multiply() {
    execute(MultiplyCommand());
  }

  void divide() {
    execute(DivideCommand());
  }

  void clear() {
    execute(ClearCommand());
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
