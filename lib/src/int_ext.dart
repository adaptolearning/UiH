extension UihIntExtension on int {
  /// Returns a list of integers from 0 to this - 1
  void times(Function(int) f) {
    for (var i = 0; i < this; i++) {
      f(i);
    }
  }

  /// Returns a list of integers from this - 1 to 0
  void timesReverse(Function(int) f) {
    for (var i = this - 1; i >= 0; i--) {
      f(i);
    }
  }
}
