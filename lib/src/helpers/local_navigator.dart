import 'package:cpe231_nsfw_flutter/src/constants/controller.dart';
import 'package:cpe231_nsfw_flutter/src/routing/router.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:flutter/material.dart';

localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: overviewPageRoute,
  onGenerateRoute: generateRoutes,
);
