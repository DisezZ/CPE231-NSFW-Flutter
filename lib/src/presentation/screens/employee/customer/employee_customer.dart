import 'package:flutter/material.dart';

class EmployeeCustomer extends StatelessWidget {
  const EmployeeCustomer({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => EmployeeCustomer());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Employee Customer'),
    );
  }
}
