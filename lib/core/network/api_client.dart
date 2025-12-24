import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiClient {
  static const _baseUrl = 'https://free-api-live-football-data.p.rapidapi.com';

  Map<String, String> apiHeader = {
    'Content-Type': 'application/json',
    'x-rapidapi-host': 'free-api-live-football-data.p.rapidapi.com',
    'x-rapidapi-key': 'cf2adcc692msh18761dc23c1ca97p10b13djsne4a41a1e6fd7',
  };

  String apiHost = "free-api-live-football-data.p.rapidapi.com";
  String apiKey = "cf2adcc692msh18761dc23c1ca97p10b13djsne4a41a1e6fd7";

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? query,
  }) async {
    final uri = Uri.parse(_baseUrl + path).replace(queryParameters: query);

    try {
      final response = await http.get(uri, headers: apiHeader);

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      }

      throw ApiException('Request failed', statusCode: response.statusCode);
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
