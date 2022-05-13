import '../data_providers/nsfw_api.dart';

class TestRepository {
  final homeApi = NsfwApi(collectionPath: '/');

  Future<Map<String, dynamic>> getFirstPageJson() async {
    final content = await homeApi.getDocuments({});
    return {"content": content.data};
  }
}
