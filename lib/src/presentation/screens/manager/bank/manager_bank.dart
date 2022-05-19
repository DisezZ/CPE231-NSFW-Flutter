import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/overview/customer_overview.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/bank/change_atm/update_atm.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/bank/change_bank/update_bank.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/widgets/option_card.dart';
import 'package:flutter/material.dart';

import '../../../widgets/title_with_custom_underlined.dart';

class ManagerBank extends StatelessWidget {
  const ManagerBank({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerBank());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      title: 'Manage Bank',
                      icon: Icons.handyman,
                      route: UpdateBankNameScreen.route()),
                ],
              ),
            ),
          ),
          const TitleWithCustomUnderlined(text: 'ATM'),
          SizedBox(
            height: kDefaultPadding * 2 + 160,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OptionCard(
                      title: 'Manage ATM',
                      icon: Icons.handyman,
                      route: UpdateAtmBranchScreen.route()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
