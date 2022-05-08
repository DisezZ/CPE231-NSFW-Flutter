import 'package:cpe231_nsfw_flutter/src/helpers/responsive.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/large_screen.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/side_menu.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/small_screen.dart';
import 'package:cpe231_nsfw_flutter/src/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildTopNavigationBar(context, scaffoldKey),
      extendBodyBehindAppBar: true,
      drawer: Drawer(child: SideMenu()),
      body: Responsive(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
