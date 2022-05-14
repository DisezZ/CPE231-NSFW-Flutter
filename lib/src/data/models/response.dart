// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/user.dart';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    ApiResponse({
        required this.error,
        required this.data,
        required this.message,
    });

    bool error;
    List<User> data;
    String message;

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
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


