import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiClient {
  static const _baseUrl = 'https://free-api-live-football-data.p.rapidapi.com';

  // Common headers for API requests
  Map<String, String> apiHeader = {
    'Content-Type': 'application/json',
    'x-rapidapi-host': 'free-api-live-football-data.p.rapidapi.com',
    // 'x-rapidapi-key': '8e02dba53emshc856639873d7006p18d686jsnacb5646ba0a3',
    'x-rapidapi-key': 'a952bc6e0fmsha73499a40ca7fd0p1f48f5jsned5d61b57a3f',
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
