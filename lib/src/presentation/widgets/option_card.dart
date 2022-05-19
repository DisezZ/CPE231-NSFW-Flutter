import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function route;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.4,
      height: 160,
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(context, route()),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 120,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
