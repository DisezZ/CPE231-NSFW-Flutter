import 'package:cpe231_nsfw_flutter/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BankPage extends StatelessWidget {
  const BankPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: 'Bank Page'),
    );
  }
}