import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  Function() onLoginClicked;

  LoginScreen({
    Key? key,
    required this.onLoginClicked,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: widget.onLoginClicked, child: Text('Login'))
      ]),
    );
  }
}
