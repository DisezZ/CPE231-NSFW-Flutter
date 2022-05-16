// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/transaction.dart';
import 'package:http/http.dart' as http;

import '../../presentation/screens/customer/transaction/loan/loan_transaction.dart';

class LoanRepository {
  LoanTransaction? _loanTransaction;

  Future<TransactionResponse> loan(
      {required String forAccountNumber, required String amount}) async {
    print(
        'loan: to ${int.parse(forAccountNumber)} with amount ${double.parse(amount)}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/Loan/create/loanContract'),
        body: jsonEncode({
          "accountId": int.parse(forAccountNumber),
          "loanAmount": double.parse(amount),
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

  Future<TransactionResponse> pay({
    required String loanNumber,
    required String forAccountNumber,
    required String amount,
  }) async {
    print(
        'pay loan: to ${int.parse(forAccountNumber)} to ${int.parse(loanNumber)} with amount ${double.parse(amount)}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/Loan/Paying/loanContract'),
        body: jsonEncode({
          "accountId": int.parse(forAccountNumber),
          "loanId": int.parse(loanNumber),
          "payAmount": double.parse(amount),
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
