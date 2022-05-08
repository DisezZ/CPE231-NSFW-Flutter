import 'package:cpe231_nsfw_flutter/src/pages/overview/overview.dart';
import 'package:cpe231_nsfw_flutter/src/pages/wallet/wallet.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case walletPageRoute:
      return _getPageRoute(WalletPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
