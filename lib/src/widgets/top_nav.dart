import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/constants/controller.dart';
import 'package:cpe231_nsfw_flutter/src/helpers/responsive.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildTopNavigationBar(
    BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    elevation: 0,
    leading: !Responsive.isSmallScreen(context)
        ? Row(
            children: [
              Padding(padding: EdgeInsets.only(left: kDefaultPadding)),
              Icon(Icons.star),
            ],
          )
        : IconButton(
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
    title: Obx(() => Row(
          children: [
            Visibility(
              visible: !Responsive.isSmallScreen(context),
              child: CustomText(
                text: "NSFW Banking",
                color: Colors.white,
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            CustomText(
              text: menuController.activeItem.string,
              color: Colors.white,
              size: 20,
              weight: FontWeight.bold,
            ),
            Expanded(child: Container()),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            Container(
              width: 1,
              height: 25,
              color: kLightGreyColor,
            ),
            SizedBox(width: kDefaultPadding),
            CustomText(text: "Lutfee Deemae", color: Colors.white),
            SizedBox(width: kDefaultPadding),
            CircleAvatar(
              backgroundColor: kLightColor,
              child: IconButton(
                onPressed: () => Get.offAllNamed(authenticationPageRoute),
                icon: Icon(Icons.person_outline),
                color: kDarkColor,
              ),
            ),
          ],
        )),
  );
}
