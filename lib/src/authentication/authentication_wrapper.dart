import 'package:cpe231_nsfw_flutter/src/authentication/login_page.dart';
import 'package:cpe231_nsfw_flutter/src/main/main_wrapper.dart';
import 'package:flutter/material.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  final isLogged = true;
  final loginPage = 'Customer';
  @override
  Widget build(BuildContext context) {
    switch (isLogged) {
      case true:
        return MainWrapper();
      default:
        return LoginPage();
    }
  }
}
