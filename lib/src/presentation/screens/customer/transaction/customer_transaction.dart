import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/topup/topup_transaction.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/transfer/transfer_transaction.dart';
import 'package:flutter/material.dart';

import 'billing/billing_transaction.dart';
import 'deposit/deposit_transaction.dart';
import 'loan/loan_transaction.dart';
import 'withdraw/widgets/withdraw_form.dart';
import 'withdraw/withdraw_transaction.dart';

class CustomerTransaction extends StatelessWidget {
  const CustomerTransaction({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CustomerTransaction());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => Navigator.push(context, TopupTransaction.route()),
            child: const Text('Topup')),
        ElevatedButton(
            onPressed: () =>
                Navigator.push(context, TransferTransaction.route()),
            child: const Text('Transfer')),
        ElevatedButton(
            onPressed: () =>
                Navigator.push(context, BillingTransaction.route()),
            child: const Text('Billing')),
        ElevatedButton(
            onPressed: () =>
                Navigator.push(context, WithdrawTransaction.route()),
            child: const Text('Withdraw')),
        ElevatedButton(
            onPressed: () =>
                Navigator.push(context, DepositTransaction.route()),
            child: const Text('Deposit')),
        ElevatedButton(
            onPressed: () =>
                Navigator.push(context, LoanTransaction.route()),
            child: const Text('Loan')),
      ],
    );
  }
}
