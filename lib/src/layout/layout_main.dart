import 'package:cpe231_nsfw_flutter/src/responsive/responsive.dart';
import 'package:flutter/material.dart';

class LayoutMain extends StatefulWidget {
  final Widget main;
  final Widget sub;
  final Widget tab;

  const LayoutMain({
    Key? key,
    required this.main,
    required this.sub,
    required this.tab,
  }) : super(key: key);

  @override
  State<LayoutMain> createState() => _LayoutMainState();
}

class _LayoutMainState extends State<LayoutMain> {
  final users = ['Customer', 'Employee', 'Manager'];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: widget.main,
        tablet: Row(
          children: [
            Expanded(
              flex: 3,
              child: widget.tab,
            ),
            Expanded(
              flex: 7,
              child: widget.main,
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: widget.tab,
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 7,
              child: widget.main,
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: widget.sub,
            ),
          ],
        ),
      ),
    );
  }
}
