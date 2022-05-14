import 'src/data/data_providers/authentication_api.dart';
import 'src/data/repositories/authentication_repository.dart';
import 'src/data/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  runApp(MyApp(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
