import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/overview/customer_overview.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/widgets/title_with_custom_underlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../../data/repositories/simple_repository.dart';
import '../../../widgets/option_card.dart';
import '../bank/change_atm/update_atm.dart';
import '../bank/change_bank/update_bank.dart';
import 'change_employee/update_employee.dart';

class ManagerEmployee extends StatelessWidget {
  ManagerEmployee({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerEmployee());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWithCustomUnderlined(text: 'Employee'),
          SizedBox(
            height: kDefaultPadding * 2 + 160,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OptionCard(
                      title: 'Manage',
                      icon: Icons.handyman,
                      route: UpdateEmployeeBranchScreen.route()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
