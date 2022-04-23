import 'package:cpe231_nsfw_flutter/src/layout/layout_main.dart';
import 'package:cpe231_nsfw_flutter/src/main/components/side_menu_view.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutMain(
        main: mainLayout(),
        sub: subLayout(),
        tab: SideMenuView(
          sideMenuItemList: [],
        ));
  }

  Widget mainLayout() {
    return Container(color: Colors.blueAccent);
  }

  Widget subLayout() {
    return Container(color: Colors.greenAccent);
  }

  Widget tabLayout() {
    return Container(color: Colors.redAccent);
  }
}
