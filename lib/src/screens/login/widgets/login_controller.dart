import '../../../app.dart';
import '../../home/home_screen.dart';
import 'package:flutter/material.dart';

class SignInController {
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

  void onForgotPasswordPressed(BuildContext context) =>
      Navigator.pushNamed(context, '/');

  Future onSignInPressed(BuildContext context) async {
    final bool isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      formKey.currentState!.save();
      //Navigator.push(context, HomeScreen(onLogoutClicked: onLogoutClicked))

      /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
      );*/
      /*try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message, Colors.red);
      }*/
      //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }
}
