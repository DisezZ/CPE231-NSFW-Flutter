import 'package:cpe231_nsfw_flutter/src/layout/layout_main.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
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
    return Container(color: Colors.limeAccent);
  }
}
