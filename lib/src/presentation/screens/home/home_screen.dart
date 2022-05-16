import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/authentication/bloc/authentication_bloc.dart';
import '../customer/customer_screen.dart';
import '../employee/employee.dart';
import '../manager/manager_screen.dart';

enum Authorization { manager, employee, customer }

class HomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ((context, state) {
      if (state.user.userId == 0) {
        return Container(
          color: Colors.transparent,
        );
      } else {
        if (state.user.positionId == 1) {
          //return the manager page
          return ManagerScreen();
        } else if (state.user.positionId == 2) {
          // return the employee page
          return EmployeeScreen();
        } else if (state.user.positionId == 3) {
          return CustomerScreen();
        } else {
          return Container(
            child: const Text('Unknown User'),
            color: Colors.blue,
          );
        }
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
