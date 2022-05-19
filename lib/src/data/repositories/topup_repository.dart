// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/topup_transaction.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/transaction.dart';
import 'package:http/http.dart' as http;

import '../../constants/api.dart';

class TopupRepository {
  TopupTransaction? _topupTransaction;

  Future<TransactionResponse> topup(
      {required String fromAccountNumber,
      required String toMobileNumber,
      required String amount}) async {
    print(
        'topup: from ${int.parse(fromAccountNumber)} to $toMobileNumber with amount ${double.parse(amount)}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            currentEndpoint + '/api/Topup/mobile'),
        body: jsonEncode({
          "fromAccountId": int.parse(fromAccountNumber),
          "mobNumber": toMobileNumber,
          "amount": double.parse(amount),
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
