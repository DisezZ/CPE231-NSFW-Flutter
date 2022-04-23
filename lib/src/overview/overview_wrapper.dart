import 'package:flutter/material.dart';

class OverviewWrapper extends StatefulWidget {
  const OverviewWrapper({Key? key}) : super(key: key);

  @override
  State<OverviewWrapper> createState() => _OverviewWrapperState();
}

class _OverviewWrapperState extends State<OverviewWrapper> {
  final users = ['Customer', 'Employee', 'Manager'];
  @override
  Widget build(BuildContext context) {
    final user = users[0];
    switch (user) {
      case 'Customer':
        return Container(
          child: Text('Overview for Customer'),
        );
      case 'Employee':
        return Container(
          child: Text('Overview for Employee'),
        );
      default:
        return Container(
          child: Text('Overview for Manager'),
        );
    }
  }
}
