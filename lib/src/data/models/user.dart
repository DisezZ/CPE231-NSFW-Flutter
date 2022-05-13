import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  final int userId;
  final int positionId;
  final String firstName;
  final String lastName;
  final int dateOfBirth;
  final String email;
  final String mobileNumber;
  final String address;
  final String sex;
  final String username;
  final String password;
  final int created;

  const User({
    required this.userId,
    required this.positionId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.mobileNumber,
    required this.address,
    required this.sex,
    required this.username,
    required this.password,
    required this.created,
  });

  static const empty = User(
      userId: 0,
      positionId: 0,
      firstName: '',
      lastName: '',
      dateOfBirth: 0,
      email: '',
      mobileNumber: '',
      address: '',
      sex: '',
      username: '',
      password: '',
      created: 0);

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [
        userId,
        positionId,
        firstName,
        lastName,
        dateOfBirth,
        email,
        mobileNumber,
        address,
        sex,
        username,
        password,
        created,
      ];
}

/*class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}
*/