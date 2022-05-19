import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.back,
    required this.title,
  }) : super(key: key);

  final bool back;
  final String title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: back
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            )
          : GestureDetector(
              onTap: () {},
              child: const Icon(Icons.menu),
            ),
      title: Text(title),
      actions: [
        back
            ? Container()
            : GestureDetector(
                onTap: () => context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested()),
                child: const Icon(Icons.logout),
              ),
      ],
    );
  }
}
