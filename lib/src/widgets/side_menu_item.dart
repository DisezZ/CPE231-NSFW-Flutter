import 'package:cpe231_nsfw_flutter/src/helpers/responsive.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/horizontal_menu_item.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/vertical_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsive.isCustomSize(context)) {
      return VerticalMenuItem(itemName: this.itemName, onTap: this.onTap);
    }

    return HorizontalMenuItem(itemName: this.itemName, onTap: this.onTap);
  }
}
