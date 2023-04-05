class Validator {
  const Validator();

  static bool isEmpty(String value) {
    return value.trim().isEmpty;
  }

  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isWeak(String value, {int length = 8}) {
    return value.length >= length;
  }

  static bool isEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static bool isEmptyFields(List<String> values) {
    bool emptyFields = false;
    for (var i = 0; i < values.length; i++) {
      if (isEmpty(values[i])) {
        emptyFields = true;
        break;
      }
    }

    return emptyFields;
  }

  static bool isEqualFields(List<String> values) {
    bool equal = true;
    final first = values[0];
    for (var i = 1; i < values.length; i++) {
      if (first != values[i]) {
        equal = false;
        break;
      }
    }

    return equal;
  }
}
