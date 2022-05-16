import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/simple_repository.dart';
import 'change_employee/update_employee.dart';

class ManagerEmployee extends StatelessWidget {
  ManagerEmployee({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerEmployee());
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: (() =>
                Navigator.push(context, UpdateEmployeeBranchScreen.route())),
            child: Text("Update Employee's Branch")),
      ],
    );
  }
}
