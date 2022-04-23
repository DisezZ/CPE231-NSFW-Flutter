import 'package:cpe231_nsfw_flutter/src/main/customer_page.dart';
import 'package:cpe231_nsfw_flutter/src/main/employee_page.dart';
import 'package:cpe231_nsfw_flutter/src/main/manager_page.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final role = 'Customer';
  @override
  Widget build(BuildContext context) {
    switch (role) {
      case 'Customer':
        return CustomerPage();
      case 'Employee':
        return EmployeePage();
      case 'Manager':
        return ManagerPage();
      default:
        return Text('Unauthorized');
    }
  }
}
