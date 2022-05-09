import 'package:cpe231_nsfw_flutter/src/routing/menu_item.dart';
import 'package:cpe231_nsfw_flutter/src/routing/routes.dart';

const transferPageDisplayName = 'Transfer Money';
const transferPageRoute = overviewPageRoute + '/transfer';

const topupPageDisplayName = 'Mobile Topup';
const topupPageRoute = overviewPageRoute + '/topup';

const billingPageDisplayName = 'Pay bill';
const billingPageRoute = overviewPageRoute + '/billing';

const withdrawPageDisplayName = 'Withdraw';
const withdrawPageRoute = overviewPageRoute + '/withdraw';

const depositPageDisplayName = 'Deposit';
const depositPageRoute = overviewPageRoute + '/deposit';

const loanPageDisplayName = 'Loaning';
const loanPageRoute = overviewPageRoute + '/loan';

List<MenuItem> transactionMenuItemRoutes = [
  MenuItem(transferPageDisplayName, transferPageRoute),
  MenuItem(topupPageDisplayName, topupPageRoute),
  MenuItem(billingPageDisplayName, billingPageRoute),
  MenuItem(withdrawPageDisplayName, withdrawPageRoute),
  MenuItem(depositPageDisplayName, depositPageRoute),
  MenuItem(loanPageDisplayName, loanPageRoute),
];