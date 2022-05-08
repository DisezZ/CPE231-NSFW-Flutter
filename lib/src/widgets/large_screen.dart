import 'package:cpe231_nsfw_flutter/src/helpers/local_navigator.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: localNavigator(),
        )
      ],
    );
  }
}
