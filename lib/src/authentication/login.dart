import 'package:cpe231_nsfw_flutter/src/authentication/components/login_form_view.dart';
import 'package:cpe231_nsfw_flutter/src/layout/layout_authentication.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final role = 'Manager';
  @override
  Widget build(BuildContext context) {
    return LayoutAuthentication(
      main: Container(
        color: Theme.of(context).cardColor,
        child: Center(child: LoginFormView()),
      ),
      sub: Container(
        color: Theme.of(context).backgroundColor,
      ),
    );
  }
}
