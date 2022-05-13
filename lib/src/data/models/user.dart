// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  User({

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
  }) {
    //uuid = const Uuid().v4();
  }

  User copyWith({
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
  }) {
    return User(
      userId: userId ?? this.userId,
      positionId: positionId ?? this.positionId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      address: address ?? this.address,
      sex: sex ?? this.sex,
      username: username ?? this.username,
      password: password ?? this.password,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'positionId': positionId,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address,
      'sex': sex,
      'username': username,
      'password': password,
      'created': created.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as int,
      positionId: map['positionId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      dateOfBirth:
          DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int),
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as String,
      address: map['address'] as String,
      sex: map['sex'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userId: $userId, positionId: $positionId, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, mobileNumber: $mobileNumber, address: $address, sex: $sex, username: $username, password: $password, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userId == userId &&
        other.positionId == positionId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.mobileNumber == mobileNumber &&
        other.address == address &&
        other.sex == sex &&
        other.username == username &&
        other.password == password &&
        other.created == created;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        positionId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dateOfBirth.hashCode ^
        email.hashCode ^
        mobileNumber.hashCode ^
        address.hashCode ^
        sex.hashCode ^
        username.hashCode ^
        password.hashCode ^
        created.hashCode;
  }

  @override
  List<Object> get props {
    return [
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
}

/*class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}
*/