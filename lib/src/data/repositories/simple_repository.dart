// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/data/models/transaction.dart';
import 'package:http/http.dart' as http;

class SimpleRepository {
  //SimpleTransaction? _transferTransaction;

  Future<TransactionResponse> updateBankName(
      {required String bankId, required String newName}) async {
    print('update bank name: from ${int.parse(bankId)} to ${newName}');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/simple/update/bankName'),
        body: jsonEncode({
          "bankId": int.parse(bankId),
          "newName": newName,
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

  Future<TransactionResponse> updateEmployeeBranch(
      {required String employeeId, required String toBranchId}) async {
    print('update atm branch: from $employeeId to $toBranchId');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/simple/update/employeeBranch'),
        body: jsonEncode({
          "employeeId": int.parse(employeeId),
          "toBranchId": int.parse(toBranchId),
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

  Future<TransactionResponse> updateAtmBranch(
      {required String atmId, required String toBranchId}) async {
    print('update atm branch: for atm $atmId to $toBranchId');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/simple/update/atmBranch'),
        body: jsonEncode({
          "atmId": int.parse(atmId),
          "toBranchId": toBranchId,
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

  Future<TransactionResponse> updateAccountMember(
      {required String accountId, required String membershipId}) async {
    print('update bank name: from ${int.parse(accountId)} to $membershipId');
    print('hello');
    final res = await http.post(
        Uri.parse(
            'https://shrouded-ocean-23479.herokuapp.com/api/simple/update/accountMember'),
        body: jsonEncode({
          "accountId": int.parse(accountId),
          "membershipId": membershipId,
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

  /*void test() {
    print('test transfer repo');
  }*/
}
