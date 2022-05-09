import 'package:flutter/material.dart';

class LoginFormController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool passwordVisibility = false;

  void onEmailSaved(String email) => email = email;
  String? validateEmail(String? email) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email!)) {
      return 'Email is invalid';
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password!.length < 6) {
      return 'Password must contains at least 6 characters';
    } else {
      return null;
    }
  }

  Future onLogInPressed(BuildContext context) async {}
}
