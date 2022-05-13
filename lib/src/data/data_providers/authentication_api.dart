import 'package:dio/dio.dart';

import 'api.dart';

class AuthenticationApi extends Api {
  Future<Response> login(dynamic data) {
    final res = dio.post('login', data: data);
    
    return res;
  }
}
