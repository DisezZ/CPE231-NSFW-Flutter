import 'package:cpe231_nsfw_flutter/src/layout/layout_main.dart';
import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key? key}) : super(key: key);

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutMain(main: mainLayout(), sub: subLayout(), tab: tabLayout());
  }

  Widget mainLayout() {
    return Container(color: Colors.blueAccent);
  }

  Widget subLayout() {
    return Container(color: Colors.greenAccent);
  }

  Widget tabLayout() {
    return Container(color: Colors.pinkAccent);
  }
}
