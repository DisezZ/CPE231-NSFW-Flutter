import 'package:cpe231_nsfw_flutter/src/responsive/responsive.dart';
import 'package:flutter/material.dart';

class LayoutCustomer extends StatefulWidget {
  final Widget main;
  final Widget sub;
  final Widget tab;

  const LayoutCustomer({
    Key? key,
    required this.main,
    required this.sub,
    required this.tab,
  }) : super(key: key);

  @override
  State<LayoutCustomer> createState() => _LayoutCustomerState();
}

class _LayoutCustomerState extends State<LayoutCustomer> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: widget.main,
        tablet: Stack(
          children: [
            Container(
              color: Colors.grey[500],
            ),
            Row(
              children: [
                Expanded(
                  flex: _size.width > 812 ? 2 : 1,
                  child: Container(),
                ),
                Expanded(
                  flex: _size.width > 812 ? 12 : 8,
                  child: widget.main,
                ),
                Expanded(
                  flex: _size.width > 812 ? 2 : 1,
                  child: Container(),
                ),
              ],
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
