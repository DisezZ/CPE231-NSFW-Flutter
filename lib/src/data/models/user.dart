import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  final int userId;
  final int positionId;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String email;
  final String mobileNumber;
  final String address;
  final String sex;
  final String username;
  final String password;
  final DateTime created;

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

  static empty() => User(
      userId: 0,
      positionId: 0,
      firstName: '',
      lastName: '',
      dateOfBirth: DateTime(2002, 5, 6),
      email: '',
      mobileNumber: '',
      address: '',
      sex: '',
      username: '',
      password: '',
      created: DateTime.now(),
      );

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

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        positionId: json["position_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        email: json["email"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        sex: json["sex"],
        username: json["username"],
        password: json["password"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "position_id": positionId,
        "first_name": firstName,
        "last_name": lastName,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "email": email,
        "mobile_number": mobileNumber,
        "address": address,
        "sex": sex,
        "username": username,
        "password": password,
        "created": created.toIso8601String(),
      };
}

/*class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}
*/