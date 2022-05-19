import 'package:cpe231_nsfw_flutter/src/presentation/screens/employee/customer/change_membership/update_membership.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/widgets/option_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/title_with_custom_underlined.dart';

class EmployeeCustomer extends StatelessWidget {
  const EmployeeCustomer({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => EmployeeCustomer());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWithCustomUnderlined(text: 'Customer'),
          SizedBox(
            height: kDefaultPadding * 2 + 160,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OptionCard(
                      title: 'Membership',
                      icon: Icons.edit,
                      route: UpdateAccountMembershipScreen.route()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
