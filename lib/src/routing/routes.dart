import 'menu_item.dart';

const rootRoute = '/';

const overviewPageDisplayName = 'Overview';
const overviewPageRoute = '/overview';

const notificationPageDisplayName = 'Notification';
const notificationPageRoute = '/notification';

const settingPageDisplayName = 'Setting';
const settingPageRoute = '/setting';

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/authentication";

const walletPageDisplayName = 'Wallet';
const walletPageRoute = '/wallet';

const transactionPageDisplayName = 'Transaction';
const transactionPageRoute = '/transaction';

const branchPageDisplayName = 'Branch';
const branchPageRoute = '/branch';

const accountPageDisplayName = 'Account';
const accountPageRoute = '/account';

const bankPageDisplayName = 'Bank';
const bankPageRoute = '/bank';

const employeePageDisplayName = 'Employee';
const employeePageRoute = '/employee';

List<MenuItem> customerSideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(walletPageDisplayName, walletPageRoute),
  MenuItem(transactionPageDisplayName, transactionPageRoute),
  MenuItem(settingPageDisplayName, settingPageRoute),
  //MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];

List<MenuItem> employeeSideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(branchPageDisplayName, branchPageRoute),
  MenuItem(accountPageDisplayName, accountPageRoute),
  MenuItem(settingPageDisplayName, settingPageRoute),
  //MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];

List<MenuItem> managerSideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(bankPageDisplayName, bankPageRoute),
  MenuItem(employeePageDisplayName, employeePageRoute),
  MenuItem(settingPageDisplayName, settingPageRoute),
  //MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];

List<List<MenuItem>> sideMenuItemRoutesList = [
  managerSideMenuItemRoutes,
  employeeSideMenuItemRoutes,
  customerSideMenuItemRoutes,
];