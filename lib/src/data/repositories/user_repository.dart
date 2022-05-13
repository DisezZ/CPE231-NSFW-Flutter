import 'dart:async';

import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';

class UserRepository {
  User? _user;
  final NsfwApi api = NsfwApi(collectionPath: '/');

  Future<void> setUser(User user) async {
    _user = user;
  }

  Future<User?> getUser() async {
    //final Response res = await api.dio.get('/');
    //print(res.data);
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(
          userId: 1,
          positionId: 3,
          firstName: 'Lutfee',
          lastName: 'Deemae',
          dateOfBirth: DateTime.now(),
          email: 'lutfeedeemae@gmail.com',
          mobileNumber: '0937168730',
          address: '10',
          sex: 'M',
          username: 'DisezZ',
          password: '1234',
          created: DateTime.now()),
    );
  }
}
