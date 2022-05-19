import 'package:cpe231_nsfw_flutter/src/presentation/widgets/custom_app_bar.dart';

import '../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import 'bank/manager_bank.dart';
import 'employee/manager_employee.dart';
import 'overview/manager_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagerScreen extends StatefulWidget {
  ManagerScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ManagerScreen());
  }

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  int _index = 0;

  final _tabs = [
    ManagerOverview(),
    const ManagerBank(),
    ManagerEmployee(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          back: false,
          title: 'Manager',
        ),
      ),
      body: _tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard), label: 'Overview'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Bank'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: 'Employee'),
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
