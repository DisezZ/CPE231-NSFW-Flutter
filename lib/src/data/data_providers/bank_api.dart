import '../models/manager.dart';
import 'package:dio/dio.dart';

import '../../constants/api.dart';
import 'api.dart';

class BankApi extends Api {
  Future<Response> getBankById(int bankId, Map<String, dynamic> param) async {
    final res = await dio.get('/banks/${bankId}', queryParameters: param);
    return res;
  }

  Future<Response> getBanks(Map<String, dynamic> param) async {
    final res = await dio.get('/banks', queryParameters: param);
    return res;
  }
}
