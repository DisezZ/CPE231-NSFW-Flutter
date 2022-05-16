import 'package:cpe231_nsfw_flutter/src/presentation/screens/employee/customer/change_membership/update_membership.dart';
import 'package:flutter/material.dart';

class EmployeeCustomer extends StatelessWidget {
  const EmployeeCustomer({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => EmployeeCustomer());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (() =>
                Navigator.push(context, UpdateAccountMembershipScreen.route())),
            child: Text("Update Employee's Branch")),
      ],
    );
  }
}
