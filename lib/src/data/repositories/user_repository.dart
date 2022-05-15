import 'dart:async';

import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';

class UserRepository {
  User? _user;
  final NsfwApi api = NsfwApi(collectionPath: '/');

  Future<User> setUser(
    User? user, {
    int? userId,
    int? positionId,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? email,
    String? mobileNumber,
    String? address,
    String? sex,
    String? username,
    String? password,
    DateTime? created,
  }) async {
    if (user == null) {
      print('USER: ${username}');
      return _user = User(
        userId: userId ?? 1,
        positionId: positionId ?? 3,
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        dateOfBirth: dateOfBirth ?? DateTime.utc(2002, 5, 6),
        email: email ?? '',
        mobileNumber: mobileNumber ?? '',
        address: address ?? '',
        sex: sex ?? '',
        username: username ?? '',
        password: password ?? '',
        created: created ?? DateTime.now(),
      );
    } else {
      _user = user;
      return user;
    }
  }

  Future<User?> getUser() async {
    return Future.delayed(const Duration(milliseconds: 100), () => _user);
  }
}
