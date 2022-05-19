import '../../../../../constants/constants.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/option_card.dart';
import '../../../../widgets/title_with_custom_underlined.dart';
import 'loaning/loaning_loan.dart';
import 'pay_loan/pay_loan.dart';
import 'package:flutter/material.dart';

class LoanTransaction extends StatelessWidget {
  const LoanTransaction({Key? key}) : super(key: key);

  static Function route() {
    return () => MaterialPageRoute<void>(builder: (_) => LoanTransaction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          back: true,
          title: 'Pay Loan',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWithCustomUnderlined(text: 'Bank'),
            SizedBox(
              height: kDefaultPadding * 2 + 160,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    OptionCard(
                        title: 'Loaning',
                        icon: Icons.currency_exchange,
                        route: LoaningTransaction.route()),
                    SizedBox(width: kDefaultPadding),
                    OptionCard(
                        title: 'Pay Loan',
                        icon: Icons.currency_exchange,
                        route: PayLoanTransaction.route()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
