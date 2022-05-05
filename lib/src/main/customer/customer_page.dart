import 'package:cpe231_nsfw_flutter/src/layout/layout_customer.dart';
import 'package:cpe231_nsfw_flutter/src/layout/layout_main.dart';
import 'package:cpe231_nsfw_flutter/src/main/components/side_menu_item_view.dart';
import 'package:cpe231_nsfw_flutter/src/main/components/side_menu_view.dart';
import 'package:cpe231_nsfw_flutter/src/main/customer/customer_notification.dart';
import 'package:cpe231_nsfw_flutter/src/main/customer/customer_overview.dart';
import 'package:cpe231_nsfw_flutter/src/main/customer/customer_setting.dart';
import 'package:cpe231_nsfw_flutter/src/main/customer/customer_wallet.dart';
import 'package:cpe231_nsfw_flutter/src/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;
  static const List<Widget> _mainWidgetOptions = [
    CustomerOverview(),
    CustomerWallet(),
    CustomerNotification(),
    CustomerSetting(),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutCustomer(
      main: mainLayout(),
      sub: subLayout(),
      tab: tabLayout(),
    );
  }

  Widget mainLayout() {
    return Scaffold(
      body: _mainWidgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Responsive.isDesktop(context)
          ? Container()
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.space_dashboard), label: 'Overview'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notification'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ],
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
    );
  }

  Widget subLayout() {
    return Container(color: Colors.greenAccent);
  }

  Widget tabLayout() {
    return Container(color: Colors.redAccent);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
