import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/constants/controller.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const VerticalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHoverItem(itemName)
            : menuController.onHoverItem("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName)
              ? kLightGreyColor.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: kDarkColor,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName),
                      ),
                      if (!menuController.isActive(itemName))
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName)
                              ? kDarkColor
                              : kLightGreyColor,
                        ))
                      else
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: kActiveColor,
                          size: 18,
                          weight: FontWeight.bold,
                        ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
