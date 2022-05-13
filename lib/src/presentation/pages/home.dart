import '../../constants/api.dart';
import '../../data/data_providers/api.dart';
import '../../data/data_providers/nsfw_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final api = Api();
    int status = 0;
    final testApi = NsfwApi(collectionPath: '/');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: testApi.getDocuments({}),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error');
              } else if (snapshot.hasData) {
                final result = snapshot.data as Response;
                return Text('Data is ${result.data}');
              } else {
                return Text('Data is: NULL');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
