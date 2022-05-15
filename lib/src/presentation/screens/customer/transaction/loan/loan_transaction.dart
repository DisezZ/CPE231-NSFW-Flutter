import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/loan/loaning/loaning_loan.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/loan/pay_loan/pay_loan.dart';
import 'package:flutter/material.dart';

class LoanTransaction extends StatelessWidget {
  const LoanTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoanTransaction());
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
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, LoaningTransaction.route());
              },
              child: Text('Loan')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, PayLoanTransaction.route());
              },
              child: Text('Pay loan')),
        ],
      ),
    );
  }
}
