// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/transaction.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:cpe231_nsfw_flutter/src/constants/api.dart';
import 'package:cpe231_nsfw_flutter/src/data/data_providers/nsfw_api.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/transfer_transaction.dart';

import '../models/response.dart';
import '../models/transfer_transaction.dart';
import '../models/user.dart';

class TransferRepository {
  TransferTransaction? _transferTransaction;

  Future<TransactionResponse> transfer(
      {required String fromAccountNumber,
      required String toAccountNumber,
      required String amount}) async {
    print(
        'transfer: from ${int.parse(fromAccountNumber)} to ${int.parse(toAccountNumber)} with amount ${double.parse(amount)}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            currentEndpoint + '/api/Transfermoney/transferApi'),
        body: jsonEncode({
          "fromAccountId": int.parse(fromAccountNumber),
          "toAccountId": int.parse(toAccountNumber),
          "transAmount": double.parse(amount),
        }),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = TransactionResponse.fromJson((res.body));
    print('Error: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }
}