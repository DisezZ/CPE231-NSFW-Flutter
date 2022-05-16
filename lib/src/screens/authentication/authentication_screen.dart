import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isAuthenticated = true;
  
  @override
  Widget build(BuildContext context) => isAuthenticated
      ? HomeScreen(onLogoutClicked: toggle)
      : LoginScreen(onLoginClicked: toggle);

  void toggle() {
    print('toggle');
    setState(() => isAuthenticated = !isAuthenticated);
  }
}
