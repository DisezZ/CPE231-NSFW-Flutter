import '../data_providers/nsfw_api.dart';

class CustomerRepository {
  final _account = [];

  Future<void> getAccountsForCustomer(int customerId) async {
    final NsfwApi api = NsfwApi(collectionPath: '/accounts');
    //final res = await api.addDocument();
    //print(object)
  }
}
