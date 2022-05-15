import 'package:flutter/material.dart';

class EmployeeOverview extends StatelessWidget {
  const EmployeeOverview({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => EmployeeOverview());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Employee Overview'),
    );
  }
}
