class NumState {
  final int number;

  const NumState({this.number});

  factory NumState.initial() {
    return NumState(number: 0);
  }
}
