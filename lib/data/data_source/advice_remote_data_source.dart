import 'dart:convert';

import 'package:flutter_bloc_architecture/data/model/advice_response.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  Future<AdviceResponse> getRandomAdviceFromAPI();
}

class AdviceRemoteDataSourceImp implements AdviceRemoteDataSource {
  AdviceRemoteDataSourceImp({required this.client});
  final http.Client client;
  @override
  Future<AdviceResponse> getRandomAdviceFromAPI() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceResponse.fromJson(responseBody);
    }
  }
}
