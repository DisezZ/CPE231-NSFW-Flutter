import 'package:flutter/material.dart';

class DepositTransaction extends StatelessWidget {
  const DepositTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DepositTransaction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: (() => Navigator.pop(context)),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(child: Text('Deposit Transaction')),
    );
  }
}
