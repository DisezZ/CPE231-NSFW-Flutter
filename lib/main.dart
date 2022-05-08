import 'package:cpe231_nsfw_flutter/src/controllers/menu_controller.dart';
import 'package:cpe231_nsfw_flutter/src/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app.dart';

void main() async {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}
