// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/user.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<AuthenticationResponse> logIn({
    required String username,
    required String password,
    required UserRepository userRepo,
  }) async {
    print('logging in');
    final nsfwApi = NsfwApi(collectionPath: '/api/Login/userLogin');
    print('get');
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
    final apiRes = authenticationResponseFromJson(res.body);
    print(res.body);
    if (apiRes.error) {
      print('error');
      //_controller.add(AuthenticationStatus.unauthenticated);
    } else {
      print('not error');
      apiRes.data.isNotEmpty
          ? await userRepo.setUser(User(
              userId: apiRes.data[0].userId,
              positionId: apiRes.data[0].positionId,
              firstName: apiRes.data[0].firstName,
              lastName: apiRes.data[0].lastName,
              dateOfBirth: apiRes.data[0].dateOfBirth,
              email: apiRes.data[0].email,
              mobileNumber: apiRes.data[0].mobileNumber,
              address: apiRes.data[0].address,
              sex: apiRes.data[0].sex,
              username: apiRes.data[0].username,
              password: apiRes.data[0].password,
              created: apiRes.data[0].created))
          : User.empty();
      final user = await userRepo.getUser();
      _controller.add(AuthenticationStatus.authenticated);
    }
    return apiRes;
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

AuthenticationResponse authenticationResponseFromJson(String str) => AuthenticationResponse.fromJson(json.decode(str));

String authenticationResponseToJson(AuthenticationResponse data) => json.encode(data.toJson());

class AuthenticationResponse {
    AuthenticationResponse({
        required this.error,
        required this.data,
        required this.message,
    });

    bool error;
    List<User> data;
    String message;

    factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => AuthenticationResponse(
        error: json["error"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}