class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^.{8,20}$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidName(String name) {
    return name.isNotEmpty;
  }

  static isValidConfirmPassword(String password,String confirmPassword) {
    return (password == confirmPassword);
  }
  static isValidPhoneNumber(String phone){
    // Only store the actual digits
    final newPhone = phone.replaceAll(RegExp("[^0-9]"), "");
    print(newPhone);
      return newPhone.isNotEmpty &&
          ((newPhone.startsWith('09') && newPhone.length == 10));
  }
}