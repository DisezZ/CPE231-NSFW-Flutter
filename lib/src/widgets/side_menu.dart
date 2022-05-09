import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/constants/controller.dart';
import 'package:cpe231_nsfw_flutter/src/helpers/responsive.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/custom_text.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _stickyOptionNumber = 0;
    final _sideMenuItemRoutes =
        sideMenuItemRoutesList[authenticationController.userPositionId - 1];

    return Container(
      color: kLightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                if (Responsive.isSmallScreen(context))
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SizedBox(width: _size.width / 48),
                          Icon(Icons.star, color: kActiveColor),
                          Flexible(
                            child: CustomText(
                              text: "Dash",
                              size: 20,
                              weight: FontWeight.bold,
                              color: kActiveColor,
                            ),
                          ),
                          SizedBox(width: _size.width / 48),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                Divider(
                  color: kLightGreyColor.withOpacity(.1),
                ),
                Column(
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var item in _sideMenuItemRoutes)
                      SideMenuItem(
                        itemName: item.name,
                        onTap: () {
                          if (item.route == authenticationPageRoute) {
                            navigationController.navigateTo(overviewPageRoute);
                            menuController
                                .changeActiveItemTo(overviewPageDisplayName);
                            Get.offAllNamed(authenticationPageRoute);
                          }
                          if (!menuController.isActive(item.name)) {
                            menuController.changeActiveItemTo(item.name);
                            if (Responsive.isSmallScreen(context)) Get.back();
                            navigationController.navigateTo(item.route);
                          }
                        },
                      )
                  ],
                ),
              ],
            ),
          ),
          /*for (var i = sideMenuItemRoutes.length - _stickyOptionNumber;
              i < sideMenuItemRoutes.length;
              i++)
            SideMenuItem(
                itemName: sideMenuItemRoutes[i].name,
                onTap: () {
                  if (sideMenuItemRoutes[i].route == authenticationPageRoute) {
                    menuController.changeActiveItemTo(overviewPageDisplayName);
                    Get.offAllNamed(authenticationPageRoute);
                  }
                  if (!menuController.isActive(sideMenuItemRoutes[i].name)) {
                    menuController
                        .changeActiveItemTo(sideMenuItemRoutes[i].name);
                    if (Responsive.isSmallScreen(context)) Get.back();
                    navigationController
                        .navigateTo(sideMenuItemRoutes[i].route);
                  }
                }),*/
        ],
      ),
    );
  }
}
/*

*/