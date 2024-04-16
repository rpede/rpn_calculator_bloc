class CalculatorState {
  final String inputText;
  final num top;
  final List<num> rest;

  CalculatorState({
    required this.inputText,
    required this.top,
    required this.rest,
  });

  static CalculatorState empty() {
    return CalculatorState(inputText: "", top: 0, rest: []);
  }

  CalculatorState copyWith({
    String? inputText,
    num? top,
    List<num>? rest,
  }) {
    return CalculatorState(
      inputText: inputText ?? this.inputText,
      top: top ?? this.top,
      rest: rest ?? this.rest,
    );
  }
}
