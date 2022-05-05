import 'package:cpe231_nsfw_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenuView extends StatefulWidget {
  final List sideMenuItemList;
  const SideMenuView({
    Key? key,
    required this.sideMenuItemList,
  }) : super(key: key);

  @override
  State<SideMenuView> createState() => _SideMenuViewState();
}

class _SideMenuViewState extends State<SideMenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Text('Logo'),
              for (var i = 0; i < widget.sideMenuItemList.length; i++)
                widget.sideMenuItemList[i],
            ],
          ),
        ),
      ),
    );
  }
}
