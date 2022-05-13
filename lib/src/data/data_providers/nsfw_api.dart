import '../../constants/api.dart';
import 'package:dio/dio.dart';

abstract class AbstractApi {
  late String endPointUri;

  getDocument(int id);
  getDocuments(Map<String, dynamic> param);

  addDocuments(List<Map<String, dynamic>> data);

  updateDocument(int id, Map<String, dynamic> data);
  updateDocuments(Map<String, dynamic> param, Map<String, dynamic> data);

  deleteDocument(int id);
  deleteDocuments(Map<String, dynamic> param, Map<String, dynamic> data);
}

class NsfwApi implements AbstractApi {
  late Dio dio;
  late String collectionPath;
  late BaseOptions options;

  @override
  String endPointUri = remoteEndpoint;

  NsfwApi({required this.collectionPath}) {
    options = BaseOptions()
      ..baseUrl = remoteEndpoint
      ..headers = {
        "Content-Type": "application/json",
        "Authorization": null,
      };
    dio = Dio(this.options);
    this.collectionPath = collectionPath;
  }

  @override
  Future<Response> getDocument(int id) async {
    final res = await dio.get(collectionPath + '/${id}');
    return res;
  }

  @override
  Future<Response> getDocuments(Map<String, dynamic> param) async {
    final res = await dio.get(collectionPath, queryParameters: param);
    return res;
  }

  @override
  Future<Response> addDocuments(List<Map<String, dynamic>> data) async {
    final res = await dio.post(collectionPath, data: data);
    return res;
  }

  @override
  Future<Response> updateDocument(int id, Map<String, dynamic> data) async {
    final res = await dio.put(collectionPath + '/${id}', data: data);
    return res;
  }

  @override
  Future<Response> updateDocuments(
      Map<String, dynamic> param, Map<String, dynamic> data) async {
    final res =
        await dio.put(collectionPath, queryParameters: param, data: data);
    return res;
  }

  @override
  Future<Response> deleteDocument(int id) async {
    final res = await dio.post(collectionPath + '/${id}');
    return res;
  }

  @override
  Future<Response> deleteDocuments(
      Map<String, dynamic> param, Map<String, dynamic> data) async {
    final res =
        await dio.post(collectionPath, queryParameters: param, data: data);
    return res;
  }
}
