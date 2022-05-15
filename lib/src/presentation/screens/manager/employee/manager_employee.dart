import 'package:flutter/material.dart';

class ManagerEmployee extends StatelessWidget {
  const ManagerEmployee({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerEmployee());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Manager Employee'),
    );
  }
}
