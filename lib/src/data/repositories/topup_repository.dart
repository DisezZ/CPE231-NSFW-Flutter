import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/constants/api.dart';
import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../models/response.dart';
import '../models/user.dart';

import 'package:http/http.dart' as http;

class TopupRepository {
  String? _slipt;

  void test() {
    print('test topup repo');
  }

  Future<ApiResponse> topup(
      {required String fromAccountNumber,
      required String toAccountNumber,
      required String amount}) async {
    print(
        'topup: from ${int.parse(fromAccountNumber)} to ${int.parse(toAccountNumber)} with amount ${double.parse(toAccountNumber)}');
    print('hello');
    final res = await NsfwApi(collectionPath: '/api/Topup/mobile').addDocument({
      fromAccountNumber: fromAccountNumber,
      toAccountNumber: toAccountNumber,
      amount: amount,
    });
    print("Status: ${res.statusCode} Body: ${res.data}");
    final decoded = apiResponseFromJson(res.data);
    print('Error: ${decoded.message}');
    return decoded;
  }
}
