class Validator {
  static emailValidator(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static passwordValidator(String password, int len) {
    return password.length >= 6;
  }

  static confirmPasswordValidator(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
