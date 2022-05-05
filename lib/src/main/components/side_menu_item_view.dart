import 'package:flutter/material.dart';

class SideMenuItem extends StatefulWidget {
  const SideMenuItem({ Key? key }) : super(key: key);

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ITEM'),
    );
  }
}