import 'dart:async';
import 'dart:convert';

import 'package:cpe231_nsfw_flutter/src/constants/api.dart';
import 'package:cpe231_nsfw_flutter/src/data/models/analysis.dart';
import 'package:http/http.dart' as http;

class AnalysisRepository {
  Future<AnalysisOneResponse> fetchFirstAnalysis() async {
    final res = await http.get(
        Uri.parse(currentEndpoint + '/api/advance/avanceAnalysis/one'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = AnalysisOneResponse.fromJson((res.body));
    print('Message: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }

  Future<AnalysisTwoResponse> fetchSecondAnalysis() async {
    final res = await http.get(
        Uri.parse(currentEndpoint + '/api/advance/avanceAnalysis/two'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = AnalysisTwoResponse.fromJson((res.body));
    print('Message: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }

  Future<AnalysisThreeResponse> fetchThirdAnalysis() async {
    final res = await http.get(
        Uri.parse(currentEndpoint + '/api/advance/avanceAnalysis/three'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = AnalysisThreeResponse.fromJson((res.body));
    print('Message: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }

  Future<AnalysisFourResponse> fetchFourthAnalysis() async {
    final res = await http.get(
        Uri.parse(currentEndpoint + '/api/advance/avanceAnalysis/four'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = AnalysisFourResponse.fromJson((res.body));
    print('Message: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }

  Future<AnalysisFiveResponse> fetchFifthAnalysis() async {
    final res = await http.get(
        Uri.parse(currentEndpoint + '/api/advance/avanceAnalysis/five'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": '',
          "Accept": "application/json",
        });
    print("Body: ${res.body}");
    final apiRes = AnalysisFiveResponse.fromJson((res.body));
    print('Message: ${apiRes.message}');
    if (!apiRes.error) {}
    return apiRes;
  }
}
