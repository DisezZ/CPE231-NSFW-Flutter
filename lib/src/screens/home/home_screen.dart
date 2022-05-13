import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  Function() onLogoutClicked;

  HomeScreen({
    Key? key,
    required this.onLogoutClicked,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: widget.onLogoutClicked, child: Text('Logout'))
      ]),
    );
  }
}
