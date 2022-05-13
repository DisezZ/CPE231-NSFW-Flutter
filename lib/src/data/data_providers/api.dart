import 'package:dio/dio.dart';

import '../../constants/api.dart';

class Api {
  late Dio dio;
  final BaseOptions dioOptions = BaseOptions(baseUrl: remoteEndpoint, headers: {
    "Content-Type": "application/json",
    "Authorization": null,
  });

  Api() {
    dio = Dio(dioOptions);
  }

  Future<Response> testApi() async {
    final res = dio.get('/');

    return res;
  }

  /// Customer related methods
  ///
  Future<Response> getCustomer(int customerId) async {
    final res = await dio.put('/customers/${customerId}');
    return res;
  }

  Future<Response> getCustomers(Map<String, dynamic> param) async {
    final res = await dio.get('/customers', queryParameters: param);
    return res;
  }

  Future<Response> addCustomers(List<Map<String, dynamic>> data) async {
    final res = await dio.post('/customers', data: {'list': data});
    return res;
  }

  Future<Response> updateCustomer(
      int customerId, Map<String, dynamic> data) async {
    final res = await dio.put('/customers/${customerId}', data: data);
    return res;
  }

  Future<Response> updateCustomers(
      Map<String, dynamic> param, Map<String, dynamic> data) async {
    final res = await dio.put('/customers', queryParameters: param, data: data);
    return res;
  }

  Future<Response> deleteCustomer(int customerId) async {
    final res = await dio.post('/customers/${customerId}');
    return res;
  }

  Future<Response> deleteCustomers(
      Map<String, dynamic> param, Map<String, dynamic> data) async {
    final res = await dio.put('/customers', queryParameters: param, data: data);
    return res;
  }
}
