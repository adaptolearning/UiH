extension uihDouble on double {
  /// return rounded double value
  double roundToDecimalPlaces(int decimalPlaces) {
    final mod = 10.0 * decimalPlaces;
    return ((this * mod).round().toDouble() / mod);
  }

  /// return a percentage string
  String toPercentage() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }

  /// return true if double is integer
  bool isInteger() {
    return this == this.toInt().toDouble();
  }

  /// return a to radians value
  double toRadians() {
    return this * (3.141592653589793238 / 180);
  }

  /// return a to degrees value
  double toDegrees() {
    return this * (180 / 3.141592653589793238);
  }

  /// Returns a string representation of this double with the given number of
  String formatDecimalPlaces(int decimalPlaces) {
    return this.toStringAsFixed(decimalPlaces);
  }
}
