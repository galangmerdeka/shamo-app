mixin InputValidationMixin {
  bool isFullnameValid(String fullname) => fullname.length <= 50;
  bool isUsernameValid(String username) =>
      username.length >= 5 && username.length <= 10;
  bool isPasswordValid(String password) => password.length >= 8;

  bool isEmailValid(String email) {
    // ignore: unused_local_variable
    RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}
