import 'package:flutter/material.dart';

class ManagerBank extends StatelessWidget {
  const ManagerBank({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerBank());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Wallet'),
    );
  }
}
