import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/customer/customer_screen.dart';

import '../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Authorization { manager, employee, customer }

class HomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      if (state.user.positionId == 1) {
        //return the manager page
        return Container(child: Text('Manager'));
      } else if (state.user.positionId == 2) {
        // return the employee page
        return Container(child: Text('Employee'));
      } else if (state.user.positionId == 3) {
        return CustomerScreen();
      } else {
        return Container(child: Text('Unknown'));
      }
    }));
  }
}

/*
Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  final userId = context.select<AuthenticationBloc, int>(
                    (bloc) => bloc.state.user.userId,
                  );
                  final usernmame = context.select<AuthenticationBloc, String>(
                    (bloc) => bloc.state.user.username,
                  );
                  return Text('UserID: $userId\n$usernmame');
                },
              ),

              /*Builder(builder: (context) {
            return Column(
              children: List.generate(
                200,
                (index) => Text('sadasd'),
              ),
            );
          })*/
            ],
          ),
        ));
 */
