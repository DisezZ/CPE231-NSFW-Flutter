import 'package:flutter/material.dart';

class CustomerOverview extends StatefulWidget {
  const CustomerOverview({ Key? key }) : super(key: key);

  @override
  State<CustomerOverview> createState() => _CustomerOverviewState();
}

class _CustomerOverviewState extends State<CustomerOverview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Overview'),
    );
  }
}