import 'dart:convert';

User positionFromJson(String str) => User.fromJson(json.decode(str));

String positionToJson(User data) => json.encode(data.toJson());

class User {
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        positionId: json["positionId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        address: json["address"],
        sex: json["sex"],
        username: json["username"],
        password: json["password"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "positionId": positionId,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "email": email,
        "mobileNumber": mobileNumber,
        "address": address,
        "sex": sex,
        "username": username,
        "password": password,
        "created": created,
      };
}
