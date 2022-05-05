import 'package:flutter/material.dart';

class CustomerNotification extends StatefulWidget {
  const CustomerNotification({Key? key}) : super(key: key);

  @override
  State<CustomerNotification> createState() => _CustomerNotificationState();
}

class _CustomerNotificationState extends State<CustomerNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Notification'),
    );
  }
}
