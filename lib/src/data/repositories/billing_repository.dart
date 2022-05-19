// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/transaction.dart';
import 'package:http/http.dart' as http;

import '../../constants/api.dart';
import '../models/billingTransaction.dart';

class BillingRepository {
  BillingTransaction? _billingTransaction;

  Future<TransactionResponse> payBill(
      {required String fromAccountNumber,
      required String billNumber}) async {
    print(
        'bill pay: from account ${int.parse(fromAccountNumber)} to bill $billNumber}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            currentEndpoint + '/api/BillingTransaction/paying/Billtransaction'),
        body: jsonEncode({
          "fromAccountId": int.parse(fromAccountNumber),
          "billId": billNumber,
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
