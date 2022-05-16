import '../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import 'branch/employee_branch.dart';
import 'customer/employee_customer.dart';
import '../manager/bank/manager_bank.dart';
import '../manager/employee/manager_employee.dart';
import '../manager/overview/manager_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'overview/employee_overview.dart';

class EmployeeScreen extends StatefulWidget {
  EmployeeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => EmployeeScreen());
  }

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  int _index = 0;

  final _tabs = [
    const EmployeeOverview(),
    const EmployeeBranch(),
    const EmployeeCustomer(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            child: const Text('Logout'),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
          ),
        ],
      ),
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard), label: 'Overview'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Branch'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: 'Customer'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _index,
        onTap: (index) => setState(() {
          _index = index;
        }),
        showUnselectedLabels: true,
      ),
    );
  }
}