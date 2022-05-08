const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const walletPageDisplayName = "Wallet";
const walletPageRoute = "/wallet";


class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(walletPageDisplayName, walletPageRoute),
];