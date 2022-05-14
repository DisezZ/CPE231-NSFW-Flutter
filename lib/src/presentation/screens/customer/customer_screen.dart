import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/overview/customer_overview.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/transaction/customer_transaction.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/wallet/customer_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CustomerScreen());
  }

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int _index = 0;

  final _tabs = [
    CustomerOverview(),
    CustomerWallet(),
    CustomerTransaction(),
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
              icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: 'Transaction'),
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
