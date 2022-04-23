import 'package:cpe231_nsfw_flutter/src/responsive/responsive.dart';
import 'package:flutter/material.dart';

class LayoutAuthentication extends StatefulWidget {
  final Widget main;
  final Widget sub;

  const LayoutAuthentication({
    Key? key,
    required this.main,
    required this.sub,
  }) : super(key: key);

  @override
  State<LayoutAuthentication> createState() => _LayoutAuthenticationState();
}

class _LayoutAuthenticationState extends State<LayoutAuthentication> {
  final users = ['Customer', 'Employee', 'Manager'];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: widget.main,
        tablet: Stack(
          children: [
            widget.sub,
            Row(
              children: [
                Expanded(
                  flex: _size.width > 812 ? 2 : 1,
                  child: Container(),
                ),
                Expanded(
                  flex: _size.width > 812 ? 7 : 8,
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
