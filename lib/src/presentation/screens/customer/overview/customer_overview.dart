import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';

class CustomerOverview extends StatelessWidget {
  const CustomerOverview({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CustomerOverview());
  }

  @override
  Widget build(BuildContext context) {
    final username = context.select<AuthenticationBloc, String>(
      (bloc) => bloc.state.user.username,
    );
    final email = context.select<AuthenticationBloc, String>(
      (bloc) => bloc.state.user.email,
    );
    return Container(
      child: Text('Customer Overview with username: ${username} with ${email}'),
    );
  }
}
