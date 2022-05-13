import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/user.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/user_repository.dart';
import 'package:cpe231_nsfw_flutter/src/presentation/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/login/bloc/login_bloc.dart';
import '../../../data/repositories/authentication_repository.dart';

class LoginScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
              userRepository: RepositoryProvider.of<UserRepository>(context),
            );
          },
          child: Padding(
              padding: EdgeInsets.all(kDefaultPadding), child: LoginForm()),
        ),
      ),
    );
  }
}
