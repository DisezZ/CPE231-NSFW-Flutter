import 'package:cpe231_nsfw_flutter/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController instance = Get.find();
  var _isLoggedIn = false.obs;
  final _user = User(
    userId: 1,
    positionId: 3,
    firstName: 'Lutfee',
    lastName: 'Deemae',
    dateOfBirth: DateTime.utc(2002, 5, 6),
    email: 'lutfeedeemae@gmail.com',
    mobileNumber: '0937168730',
    address: '10, Yaha Subdistrict, Yaha District, Yala Province, 95120',
    sex: 'M',
    username: 'DisezZ',
    password: '1234',
    created: DateTime.now(),
  ).obs;

  get user => _user.value;

  get userPositionId => _user.value.positionId;

  get isLoggedIn => _isLoggedIn.value;

  toggleLoggedIn() {
    _isLoggedIn.value = !_isLoggedIn.value;
    update();
  }
}
/*
final _user = User(
    userId: 1,
    positionId: 3,
    firstName: 'Lutfee',
    lastName: 'Deemae',
    dateOfBirth: DateTime.utc(2002, 5, 6),
    email: 'lutfeedeemae@gmail.com',
    mobileNumber: '0937168730',
    address: '10, Yaha Subdistrict, Yaha District, Yala Province, 95120',
    sex: 'M',
    username: 'DisezZ',
    password: '1234',
    created: DateTime.now(),
  ).obs; */