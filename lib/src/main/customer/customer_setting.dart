import 'package:flutter/material.dart';

class CustomerSetting extends StatefulWidget {
  const CustomerSetting({ Key? key }) : super(key: key);

  @override
  State<CustomerSetting> createState() => _CustomerSettingState();
}

class _CustomerSettingState extends State<CustomerSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Setting'),
    );
  }
}