import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/bank/change_atm/update_atm.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/bank/change_bank/update_bank.dart';
import 'package:flutter/material.dart';

class ManagerBank extends StatelessWidget {
  const ManagerBank({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerBank());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (() =>
                Navigator.push(context, UpdateAtmBranchScreen.route())),
            child: Text("Manage ATM")),
        ElevatedButton(
            onPressed: (() =>
                Navigator.push(context, UpdateBankNameScreen.route())),
            child: Text("Manage Bank")),
      ],
    );
  }
}
