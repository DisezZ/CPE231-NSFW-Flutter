import 'package:flutter/material.dart';

class CustomerWallet extends StatelessWidget {
  const CustomerWallet({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CustomerWallet());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Wallet'),
    );
  }
}
