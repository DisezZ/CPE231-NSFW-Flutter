import 'package:cpe231_nsfw_flutter/src/business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/bank/manager_bank.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/employee/manager_employee.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/manager/overview/manager_overview.dart';
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
    const ManagerOverview(),
    const ManagerBank(),
    const ManagerEmployee(),
    Container()
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