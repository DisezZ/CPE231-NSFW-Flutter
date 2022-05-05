import 'package:cpe231_nsfw_flutter/src/main/customer/customer_page.dart';
import 'package:cpe231_nsfw_flutter/src/main/employee/employee_page.dart';
import 'package:cpe231_nsfw_flutter/src/main/manager/manager_page.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final role = 'Employee';
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
