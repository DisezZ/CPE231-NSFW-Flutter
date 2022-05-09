import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHoverItem(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _buildCustomIcon(Icons.space_dashboard, itemName);
      case settingPageDisplayName:
        return _buildCustomIcon(Icons.settings, itemName);
      case authenticationPageDisplayName:
        return _buildCustomIcon(Icons.logout, itemName);
      case walletPageDisplayName:
        return _buildCustomIcon(Icons.account_balance_wallet, itemName);
      case transactionPageDisplayName:
        return _buildCustomIcon(Icons.currency_exchange, itemName);
      case branchPageDisplayName:
        return _buildCustomIcon(Icons.store, itemName);
      case accountPageDisplayName:
        return _buildCustomIcon(Icons.contact_mail, itemName);
      case bankPageDisplayName:
        return _buildCustomIcon(Icons.account_balance, itemName);
      case employeePageDisplayName:
        return _buildCustomIcon(Icons.people_alt, itemName);
      default:
        return _buildCustomIcon(Icons.space_dashboard, itemName);
    }
  }

  Widget _buildCustomIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: kActiveColor);

    return Icon(icon,
        color: isHovering(itemName) ? kDarkColor : kLightGreyColor);
  }
}
