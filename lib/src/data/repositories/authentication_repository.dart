import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/response.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<ApiResponse> logIn({
    required String username,
    required String password,
  }) async {
    print('logging in');
    final nsfwApi = NsfwApi(collectionPath: '/api/Login/userLogin');
    print('get');
    try {
      /*final res = await http.post(
          Uri.parse(
              'https://shrouded-ocean-23479.herokuapp.com/api/Login/userLogin'),
          body: {
            username: username,
            password: password,
          });*/
      final res = await http.post(
          Uri.parse(
              'https://shrouded-ocean-23479.herokuapp.com/api/Login/userLogin'),
          body: jsonEncode({
            "username": username,
            "password": password,
          }),
          headers: {
            "Content-Type": "application/json",
            "Authorization": '',
            "Accept": "application/json",
          });

      final data = apiResponseFromJson(res.body);
      if (data.error) {
        print('error');
        _controller.add(AuthenticationStatus.unauthenticated);
      } else {
        print('not error');
        _controller.add(AuthenticationStatus.authenticated);
      }
      return data;
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      throw e;
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
