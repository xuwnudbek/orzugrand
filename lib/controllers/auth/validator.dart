class Validator {
  static emailValidator(String? email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email ?? '');
  }

  static phoneValidator(String? phone) {
    //check phone starts with +998 and has 13 characters
    return RegExp(r"^\+998\d{9}").hasMatch(phone ?? '');
  }
}
