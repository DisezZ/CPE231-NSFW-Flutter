import 'package:cpe231_nsfw_flutter/src/presentation/widgets/title_with_custom_underlined.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/option_card.dart';
import 'topup/topup_transaction.dart';
import 'transfer/transfer_transaction.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithCustomUnderlined(text: 'Transaction'),
            SizedBox(height: kDefaultPadding),
            Wrap(
              runSpacing: kDefaultPadding,
              spacing: kDefaultPadding,
              children: [
                OptionCard(
                  title: 'Topup',
                  icon: Icons.currency_exchange,
                  route: TopupTransaction.route(),
                ),
                OptionCard(
                  title: 'Transfer',
                  icon: Icons.currency_exchange,
                  route: TransferTransaction.route(),
                ),
                OptionCard(
                  title: 'Billing',
                  icon: Icons.currency_exchange,
                  route: BillingTransaction.route(),
                ),
                OptionCard(
                  title: 'Withdraw',
                  icon: Icons.currency_exchange,
                  route: WithdrawTransaction.route(),
                ),
                OptionCard(
                  title: 'Deposit',
                  icon: Icons.currency_exchange,
                  route: DepositTransaction.route(),
                ),
                OptionCard(
                  title: 'Loan',
                  icon: Icons.currency_exchange,
                  route: LoanTransaction.route(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



/*
Column(
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
*/