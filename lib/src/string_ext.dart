extension uihString on String {
  /// return true if string is email
  bool isEmail() {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(this);
  }

  /// return true if string contains value
  bool containsIgnoreCase(String value) {
    return this.toLowerCase().contains(value.toLowerCase());
  }

  /// return camel case string
  String toCamelCase() {
    final words = this.split(' ');
    if (words.length == 1) return this.toLowerCase();
    final result = words[0].toLowerCase() +
        words.sublist(1).map((word) {
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        }).join('');
    return result;
  }

  /// return capitalized string
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// return reversed string
  String reverse() {
    return split('').reversed.join();
  }
}
