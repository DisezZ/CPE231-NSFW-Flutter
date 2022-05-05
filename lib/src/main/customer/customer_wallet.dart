import 'package:flutter/material.dart';

class CustomerWallet extends StatefulWidget {
  const CustomerWallet({ Key? key }) : super(key: key);

  @override
  State<CustomerWallet> createState() => _CustomerWalletState();
}

class _CustomerWalletState extends State<CustomerWallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Customer Wallet'),
    );
  }
}