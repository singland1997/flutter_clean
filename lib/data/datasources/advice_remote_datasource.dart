import 'dart:convert';

import 'package:flutter_clean/data/exceptions/exceptions.dart';
import 'package:flutter_clean/data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
    final jsonBody = json.decode(response.body);
    return AdviceModel.fromJson(jsonBody);
  }
}
