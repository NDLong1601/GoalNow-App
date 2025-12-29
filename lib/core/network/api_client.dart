import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiClient {
  static const _baseUrl = 'https://free-api-live-football-data.p.rapidapi.com';

  // Common headers for API requests
  Map<String, String> apiHeader = {
    'Content-Type': 'application/json',
    'x-rapidapi-host': 'free-api-live-football-data.p.rapidapi.com',
    'x-rapidapi-key': '03c5ccb574mshb0fc04d4e2bf4d6p1ab077jsn7de6d9270583',
    // 'x-rapidapi-key': '804d887140msh20ac4c21ae4aaecp1ae95ajsnb755024d5d51',
  };

  /// Generic GET request method
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? query,
  }) async {
    final uri = Uri.parse(_baseUrl + path).replace(queryParameters: query);

    try {
      final response = await http.get(uri, headers: apiHeader);
      // Successful response
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      }
      // Error response
      throw ApiException('Request failed', statusCode: response.statusCode);
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
