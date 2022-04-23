import 'package:cpe231_nsfw_flutter/src/authentication/components/login_form_view.dart';
import 'package:cpe231_nsfw_flutter/src/layout/layout_authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
