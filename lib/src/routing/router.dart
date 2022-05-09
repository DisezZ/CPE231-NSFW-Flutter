import 'package:cpe231_nsfw_flutter/src/pages/account/account.dart';
import 'package:cpe231_nsfw_flutter/src/pages/bank/bank.dart';
import 'package:cpe231_nsfw_flutter/src/pages/branch/branch.dart';
import 'package:cpe231_nsfw_flutter/src/pages/employee/employee.dart';
import 'package:cpe231_nsfw_flutter/src/pages/overview/overview.dart';
import 'package:cpe231_nsfw_flutter/src/pages/setting/setting.dart';
import 'package:cpe231_nsfw_flutter/src/pages/transaction/transaction.dart';
import 'package:cpe231_nsfw_flutter/src/pages/wallet/wallet.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case settingPageRoute:
      return _getPageRoute(SettingPage());
    case walletPageRoute:
      return _getPageRoute(WalletPage());
    case transactionPageRoute:
      return _getPageRoute(TransactionPage());
    case branchPageRoute:
      return _getPageRoute(BranchPage());
    case accountPageRoute:
      return _getPageRoute(AccountPage());
    case bankPageRoute:
      return _getPageRoute(BankPage());
    case employeePageRoute:
      return _getPageRoute(EmployeePage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
